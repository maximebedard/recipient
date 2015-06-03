require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  include HasNutrientsTest
  include StarrableTest

  def setup
    @subject = FactoryGirl.create :ingredient
    @user = FactoryGirl.create :user
  end
end
