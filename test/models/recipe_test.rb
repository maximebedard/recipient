require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @subject = FactoryGirl.create :recipe
    @new_subject = Recipe.new
  end

  test '#name is present' do
    assert_presence_of @new_subject, :name
  end
end
