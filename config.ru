$LOAD_PATH.unshift 'lib'

require 'server'
use Rack::ShowExceptions
Server::Base.run! do |server|
  if ENV.include? 'SSL_DIR'
    server.ssl = true
    server.ssl_options = {
      verify_peer: false,
      cert_chain_file: "#{ENV['SSL_DIR']}/cert",
      private_key_file: "#{ENV['SSL_DIR']}/key"
    }
  end
end

