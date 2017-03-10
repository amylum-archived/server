path = File.dirname(ENV['BUNDLE_GEMFILE'] || '.')
ruby File.read(File.join(path, '.circle-ruby')).chomp
source 'https://rubygems.org'

gem 'sinatra', '~> 1.4.6'
gem 'puma', '~> 3.8.0'
gem 's3repo', '~> 1.0.0'
gem 'herokuconf', '~> 0.0.8'
gem 'rack-ssl', '~> 1.4.1'

group :development do
  gem 'rubocop', '~> 0.47.0'
  gem 'rake', '~> 12.0.0'
  gem 'codecov', '~> 0.1.1'
  gem 'rspec', '~> 3.5.0'
  gem 'fuubar', '~> 2.2.0'
end
