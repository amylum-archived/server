path = File.dirname(ENV['BUNDLE_GEMFILE'] || '.')
ruby File.read(File.join(path, '.circle-ruby')).chomp
source 'https://rubygems.org'

gem 'sinatra', '~> 2.0.0'
gem 'puma', '~> 3.10.0'
gem 's3repo', '~> 1.0.0'
gem 'herokuconf', '~> 0.0.8'
gem 'rack-ssl', '~> 1.4.1'

group :development do
  gem 'rubocop', '~> 0.50.0'
  gem 'goodcop', '~> 0.0.1'
  gem 'rake', '~> 12.1.0'
  gem 'codecov', '~> 0.1.1'
  gem 'rspec', '~> 3.6.0'
  gem 'fuubar', '~> 2.2.0'
end
