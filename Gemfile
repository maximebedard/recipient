source 'https://rubygems.org'
gem 'rails', '4.1.8'
ruby '2.1.5'

group :assets do
  gem 'sass-rails', '>= 4.0.3'
  gem 'uglifier', '>= 1.3.0'
  gem 'coffee-rails', '~> 4.0.0'
end

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'unitwise-rails', github: 'maximebedard/unitwise-rails'

# SASS
gem 'bootstrap-sass', '~> 3.3.1'
gem 'font-awesome-sass'

# Authentification
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'

# Images
gem 'carrierwave', github: 'carrierwaveuploader/carrierwave'
gem 'mini_magick'

gem 'pg'

group :development, :test do
  gem 'pry-byebug'
  gem 'spring'
  gem 'factory_girl_rails'
  gem 'rubocop', require: false
  gem 'better_errors'
end

group :test do
  gem 'codeclimate-test-reporter'
end

group :production do
  gem 'rails_12factor'
end
