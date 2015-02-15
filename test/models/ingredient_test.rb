require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  def setup
    @subject = FactoryGirl.build :ingredient
    @new_subject = Ingredient.new
  end

  test '#name is unique' do
    assert_uniqueness_of @subject, :name
  end

  test '#name is present' do
    assert_presence_of @new_subject, :name
  end

  test '#calories are present' do
    assert_presence_of @new_subject, :calories
  end

  test '#serving is present' do
    assert_presence_of @new_subject, :serving
  end

  test '#saturated_and_trans_fats' do
    @subject.trans_fat = Unitwise(1, 'g')
    @subject.saturated_fat = Unitwise(1, 'g')
    assert_equal Unitwise(2, 'g'), @subject.saturated_and_trans_fats
  end

  test '#daily_value' do
    assert_nil @subject.daily_value_of(:protein)
    assert_nil @subject.daily_value_of(:sugar)
    assert_equal 0.04, @subject.daily_value_of(:carbohydrate)
  end
end
