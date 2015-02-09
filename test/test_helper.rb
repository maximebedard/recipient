ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'codeclimate-test-reporter'
require 'helpers/model_assertions_helper'
require 'pry-byebug'

class ActiveSupport::TestCase
  fixtures :all

  include ModelAssertionsHelper
end
