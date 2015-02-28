require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  def setup
    @subject = FactoryGirl.build :ingredient
  end

  test '#saturated_and_trans_fats sums both attributes' do
    @subject.trans_fat = Unitwise(1, 'g')
    @subject.saturated_fat = Unitwise(1, 'g')
    assert_equal Unitwise(2, 'g'), @subject.saturated_and_trans_fats
  end

  test '#daily_value return the value calculated according to the canadian food guide' do
    assert_equal 0.04, @subject.daily_value_of(:carbohydrate)
  end

  test '#daily_value is nil for protein and sugar' do
    assert_nil @subject.daily_value_of(:protein)
    assert_nil @subject.daily_value_of(:sugar)
  end
end
