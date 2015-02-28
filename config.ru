$LOAD_PATH.unshift 'lib'
require 'server'
use Rack::ShowExceptions
run Server::Base.new

