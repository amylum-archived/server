require 'sinatra/base'
require 's3repo'
require 'rack/ssl'

##
# Server module, defines constants and main Sinatra class
module Server
  REPO_NAME = ENV['S3REPO_NAME'] || ENV['S3_BUCKET']
  fail('Please set S3REPO_NAME or S3_BUCKET') unless REPO_NAME

  REPO = S3Repo.new

  ##
  # Main Sinatra class, routes incoming requests
  class Base < Sinatra::Base
    use Rack::SSL
    set :views, 'views'

    get(/^\/[\w_-]+\.db(?:\.tar\.[gx]z)?$/) do
      headers 'Cache-Control' => 'max-age=no-cache'
      serve 'repo.db', 500, :no_db
    end

    get(/^\/([\w_.-]+\.pkg\.tar\.xz)$/) do |package|
      halt(404, erb(:missing)) unless REPO.include? package
      headers 'Cache-Control' => 'max-age=86400'
      serve package, 404, :missing
    end

    def serve(key, fail_code, fail_template)
      res = REPO.serve key
      halt(fail_code, erb(fail_template)) unless res
      content_type 'application/octet-stream'
      res
    end

    get '/' do
      @repo = REPO_NAME
      @packages = REPO.packages
      erb :index
    end
  end
end
