require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @subject = FactoryGirl.build :recipe
    @user = FactoryGirl.create :user
  end

  test '#star the recipie twice is impossible' do
    @subject.stars.build(user: @user)
    @subject.stars.build(user: @user)
    @subject.save!
    assert @subject.invalid?
  end
end
