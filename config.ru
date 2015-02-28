$LOAD_PATH.unshift 'lib'

require 'herokuconf'
HerokuConf.configure!

require 'server'
use Rack::ShowExceptions
run Server::Base.new

