source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.8'
ruby '2.1.5'

group :assets do

  # Use SCSS for stylesheets
  gem 'sass-rails', '>= 4.0.3'
  # Use Uglifier as compressor for JavaScript assets
  gem 'uglifier', '>= 1.3.0'
  # Use CoffeeScript for .js.coffee assets and views
  gem 'coffee-rails', '~> 4.0.0'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer',  platforms: :ruby
end

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'unitwise'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
#gem 'unicorn'

# Bootstrap
gem 'bootstrap-sass', '~> 3.3.1'

# Font awesome sass
gem 'font-awesome-sass'

# ReactJS
gem 'react-rails', '~> 1.0.0.pre', github: 'reactjs/react-rails'

# Authentification
gem 'devise'
gem 'omniauth'
gem 'omniauth-facebook'
gem "omniauth-google-oauth2"

gem "paperclip", "~> 4.2"

group :development, :test do
  gem 'sqlite3'
  gem 'spring'
  # gem 'capistrano-rails'
  # gem 'debugger', group: [:development, :test]

  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails'
  gem 'rubocop', require: false
  gem 'better_errors'
end

group :test do
  gem "codeclimate-test-reporter"
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end