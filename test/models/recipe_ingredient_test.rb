require 'test_helper'

class RecipeIngredientTest < ActiveSupport::TestCase
  def setup
    @subject = FactoryGirl.create :recipe_ingredient
    @new_subject = RecipeIngredient.new
  end

  test '#total_calories returns the adjusted calories for this portion' do
    assert_equal @subject.total_calories, Unitwise(470, 'J')
    assert_equal @subject.total_calories!, Unitwise(470, 'J')
  end

  test '#total_calories returns nil if the unit are not compatible' do
    @subject.quantity = Unitwise(1, 'watt')
    assert_nil @subject.total_calories
  end

  test '#total_calories! raises if the unit are not compatible' do
    @subject.quantity = Unitwise(1, 'watt')
    assert_raises(Unitwise::ConversionError) { @subject.total_calories! }
  end

  test '#respond_to is false for total_serving since it is not permitted' do
    refute_respond_to @subject, :total_serving
  end

  test '#quantity is present' do
    assert_presence_of @new_subject, :quantity
  end

  test '#ingredient is present' do
    assert_presence_of @new_subject, :ingredient
  end

  test '#recipe is present' do
    assert_presence_of @new_subject, :recipe
  end

  test '#ingredient_serving_unit returns the associated unit of the ingredient' do
    assert :gram, @subject.ingredient_serving_unit
  end

  test '#convert_quantity_to_match_ingredient returns the quantity with the matching unit' do
    assert Unitwise(1000, 'g'), @subject.convert_quantity_to_match_ingredient
  end
end
