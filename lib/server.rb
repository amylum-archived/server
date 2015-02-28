require 'sinatra/base'
require 's3repo'

module Server
  REPO_NAME = ENV['S3REPO_NAME'] || ENV['S3_BUCKET']
  fail('Please set S3REPO_NAME or S3_BUCKET') unless REPO_NAME

  CLIENT = S3Repo.new

  class Base < Sinatra::Base
    enable :logging

    get %r{^/#{REPO_NAME}\.db(?:\.tar\.gz)?$} do
      CLIENT.serve("#{REPO_NAME}.db")
    end

    get %r{^/([\w-]+)\.pkg\.tar\.xz$} do |package|
      CLIENT.serve("#{package}.pkg.tar.xz", false)
    end
  end
end
