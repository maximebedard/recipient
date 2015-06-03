require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  include HasNutrientsTest

  def setup
    @subject = FactoryGirl.build :recipe
  end
end
