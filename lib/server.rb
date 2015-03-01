require 'sinatra/base'
require 's3repo'

##
# Server module, defines constants and main Sinatra class
module Server
  REPO_NAME = ENV['S3REPO_NAME'] || ENV['S3_BUCKET']
  fail('Please set S3REPO_NAME or S3_BUCKET') unless REPO_NAME

  REPO = S3Repo.new

  ##
  # Main Sinatra class, routes incoming requests
  class Base < Sinatra::Base
    get(/^\/#{REPO_NAME}\.db(?:\.tar\.[gx]z)?$/) do
      serve 'repo.db', 500, 'Repo Database missing, please contact maintainer'
    end

    get(/^\/([\w_.-]+\.pkg\.tar\.xz)$/) do |package|
      halt(404, 'Package not found') unless REPO.packages.include? package
      serve package, 404, 'Package not found'
    end

    def serve(key, fail_code, fail_msg)
      res = REPO.serve 'key'
      halt(fail_code, fail_msg) unless res
      content_type 'application/octet-stream'
      res
    end
  end
end
