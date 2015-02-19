require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  def setup
    @recipe = create(:recipe)
  end

  test '#index' do
    get :index
    assert_equal assigns(:recipes), [@recipe]
  end

  test '#show' do
    get :show, id: @recipe.id
    assert_equal assigns(:recipe), @recipe
  end

  test '#starred logged in' do
  end

  test '#starred as guest' do
  end
end
