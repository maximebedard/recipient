require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  def setup
    @recipe = create(:recipe)
  end

  test 'route to all recipes' do
    assert_routing '/recipes', controller: 'recipes', action: 'index'
  end

  test 'route to a recipe' do
    assert_routing "/recipes/#{@recipe.id}", controller: 'recipes', action: 'show', id: "#{@recipe.id}"
  end

  test '#index' do
    get :index
    assert_equal assigns(:recipes), [@recipe]
    assert_template :index
  end

  test '#show' do
    get :show, id: @recipe.id
    assert_equal assigns(:recipe), @recipe
    assert_template :show
  end

  test '#starred logged in' do
  end

  test '#starred as guest' do
  end
end
