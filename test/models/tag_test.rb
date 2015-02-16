require 'test_helper'

class TagTest < ActiveSupport::TestCase
  def setup
    @tag = FactoryGirl.build :tag
  end

  test '#color is set upon before validation' do
    assert_nil @tag.color
    @tag.save!
    refute_nil @tag.color
  end
end
