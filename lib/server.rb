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
      content_type 'application/octet-stream'
      REPO.serve 'repo.db'
    end

    get(/^\/([\w-_]+)\.pkg\.tar\.xz$/) do |package|
      content_type 'application/octet-stream'
      REPO.serve "#{package}.pkg.tar.xz"
    end
  end
end
