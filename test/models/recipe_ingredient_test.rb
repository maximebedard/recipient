require 'test_helper'

class RecipeIngredientTest < ActiveSupport::TestCase
  def setup
    @subject = FactoryGirl.create :recipe_ingredient
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
end
