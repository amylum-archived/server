address = ENV['ADDRESS'] || '[::]'
port = ENV['PORT'] || 9292

if ENV['SSL_DIR']
  ssl_bind address, port, key: ENV['SSL_DIR'] + '/key', cert: ENV['SSL_DIR'] + '/cert'
else
  bind "tcp://#{address}:#{port}"
end

