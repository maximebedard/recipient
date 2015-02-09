require 'test_helper'

class RecipeIngredientTest < ActiveSupport::TestCase
  def setup
    @subject = FactoryGirl.create :recipe_ingredient
  end

  test '#total_calories returns the amount of calories for the total portion' do
    @subject.quantity = Unitwise(1000, 'g')
    @subject.ingredient.serving = Unitwise(100, 'g')
    assert_equal @subject.total_calories, Unitwise(470, 'J')
  end

  test '#total_calories raises if the units are not compatible' do
    @subject.quantity = Unitwise(100, 'g')
    @subject.ingredient.serving = Unitwise(100, 'watt')
    assert_nil @subject.total_calories
  end

  test 'subject does not respond to total_serving' do
    refute_respond_to @subject, :total_serving
  end

  test '#quantity is present'
  test '#quantity is compatible with the ingredient serving unit'
  test '#quantity is converted to the ingredient serving unit'
  test '#ingredient_serving_unit returns the associated serving unit'
end
