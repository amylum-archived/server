address = ENV['ADDRESS'] || '[::]'

http_port = ENV['HTTP_PORT'] || ENV['PORT'] || 80
bind "tcp://#{address}:#{http_port}"

if ENV['SSL_DIR']
  https_port = ENV['HTTPS_PORT'] || 443
  ssl_bind(
    address,
    https_port,
    key: ENV['SSL_DIR'] + '/key',
    cert: ENV['SSL_DIR'] + '/cert'
  )
else
  bind "tcp://#{address}:#{port}"
end

