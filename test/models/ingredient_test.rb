require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  include HasNutrientsTest
  #include StarrableTest

  def setup
    @subject = FactoryGirl.build :ingredient
  end
end
