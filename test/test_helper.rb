require 'simplecov'
SimpleCov.start
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'mocha/mini_test'
require 'codeclimate-test-reporter'
require 'pry-byebug'

Dir[Rails.root.join("test/shared/**/*")].each { |f| require f }

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

class ActionController::TestCase
  include Devise::TestHelpers
end
