require 'test_helper'

class StarTest < ActiveSupport::TestCase
  def setup
    @starrable = FactoryGirl.create :recipe
    @user = FactoryGirl.create :user
  end

  test '#valid? adding two stars to a starrable raises' do
    star = Star.new(starrable: @starrable, user: @user)
    star.save!
    assert_raise(ActiveRecord::RecordInvalid) { star.dup.save! }
  end

  test '#valid? the star must have a starrable and a user' do
    star = Star.new
    refute star.valid?
  end
end
