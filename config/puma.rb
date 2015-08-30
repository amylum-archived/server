address = ENV['PUMA_ADDRESS'] || 'localhost'

http_port = ENV['PUMA_HTTP_PORT'] || ENV['PUMA_PORT'] || 8080
bind "tcp://#{address}:#{http_port}"

if ENV['PUMA_SSL']
  https_port = ENV['PUMA_HTTPS_PORT'] || 8443
  ssl_bind(
    address,
    https_port,
    key: ENV['PUMA_SSL_DIR'] + '/key',
    cert: ENV['PUMA_SSL_DIR'] + '/cert'
  )
end
