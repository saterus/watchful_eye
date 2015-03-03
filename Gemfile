source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '~> 4.2.0'

gem 'awesome_print'
gem 'bourbon'
gem 'jquery-rails'
gem 'pg'
gem 'responders'
gem 'sass-rails', '~> 5.0.1'
gem 'slim-rails'
gem 'uglifier'

group :development, :test do
  gem 'dotenv-rails'
  gem 'foreman'
  gem 'letter_opener'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-remote'
  gem 'pry-rescue'
  gem 'quiet_assets'
end

group :test do
  gem 'rspec-rails'
  gem 'timecop'
end

group :development, :test, :staging do
  gem 'bullet'
  gem 'flamegraph'
  gem 'rack-mini-profiler'
  gem 'stackprof'
end

group :staging, :production do
  gem 'rails_12factor'
end
