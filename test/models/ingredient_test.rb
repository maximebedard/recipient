require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  def setup
    @subject = FactoryGirl.create :ingredient
  end

  test 'name is unique' do
    assert_uniqueness_of @subject, :name
  end

  test 'name is present' do
    ingredient = Ingredient.new
    assert_presence_of ingredient, :name
  end

  test '#saturated_and_trans_fats' do
    assert_equal Unitwise(0, 'g'), @subject.saturated_and_trans_fats
  end

  test '#daily_value' do
    assert_nil @subject.daily_value_of(:protein)
    assert_nil @subject.daily_value_of(:sugar)
    assert_equal 0.04, @subject.daily_value_of(:carbohydrate)
  end
end
