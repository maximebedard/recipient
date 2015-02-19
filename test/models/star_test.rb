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

  test '#starred the starrable can only be done once' do
    @starrable.starred(@user)
    assert_no_difference -> { @starrable.stars.size } do
      @starrable.starred(@user)
    end
  end

  test '#starred add a star to the starrable' do
    assert_difference -> { @starrable.stars.size }, 1 do
      @starrable.starred(@user)
    end
  end

  test '#starred a starrable' do
    star = @starrable.starred(@user)
    assert_equal @user, star.user
    assert_equal @starrable, star.starrable
  end

  test '#unstarred a starrable that is not starred does nothing' do
    assert_no_difference -> { @starrable.stars.size } do
      @starrable.unstarred(@user)
    end
  end

  test '#unstarred a starred starrable' do
    @starrable.starred(@user)
    assert_difference -> { @starrable.stars.size }, -1 do
      @starrable.unstarred(@user)
    end
  end

  test '#starred?' do
    refute @starrable.starred?(@user)
    @starrable.starred(@user)
    assert @starrable.starred?(@user)
  end

  test '#toggle_starred add star if not present' do
    @starrable.toggle_starred(@user)
    assert @starrable.starred?(@user)
  end

  test '#toggle_star remove star if present' do
    @starrable.starred(@user)
    @starrable.toggle_starred(@user)
    refute @starrable.starred?(@user)
  end
end
