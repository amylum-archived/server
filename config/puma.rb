address = ENV['ADDRESS'] || 'localhost'

http_port = ENV['HTTP_PORT'] || ENV['PORT'] || 8080
bind "tcp://#{address}:#{http_port}"

if ENV['PUMA_SSL']
  https_port = ENV['HTTPS_PORT'] || 8443
  ssl_bind(
    address,
    https_port,
    key: ENV['SSL_DIR'] + '/key',
    cert: ENV['SSL_DIR'] + '/cert'
  )
end
