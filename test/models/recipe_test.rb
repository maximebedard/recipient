require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @subject = FactoryGirl.build :recipe
  end
end
