ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'mocha/mini_test'
require 'codeclimate-test-reporter'
require 'pry-byebug'

class ActiveSupport::TestCase
end
