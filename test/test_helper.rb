ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/pride'
require 'codeclimate-test-reporter'
require 'recipient_assertions'
require 'pry-byebug'

class ActiveSupport::TestCase
  fixtures :all

  include RecipientAssertions
end
