require 'test_helper'

class RecipesControllerTest < ActionController::TestCase
  def setup
    @recipe = create(:recipe)
    @user = create(:user)
  end

  test 'route to all recipes' do
    assert_routing '/recipes', controller: 'recipes', action: 'index'
  end

  test 'route to a recipe' do
    assert_routing "/recipes/#{@recipe.id}", controller: 'recipes', action: 'show', id: @recipe.id.to_s
  end

  test 'route to starred a recipe' do
    assert_routing({ method: :post, path: "/recipes/#{@recipe.id}/starred" },
                   controller: 'recipes', action: 'starred', id: @recipe.id.to_s)
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

  test '#starred an unstarred repository' do
    sign_in @user
    post :starred, id: @recipe.id, format: :json
    assert @recipe.starred?(@user)
  end

  test '#starred an already starred repository' do
    sign_in @user
    @recipe.starred(@user)
    post :starred, id: @recipe.id, format: :json
    refute @recipe.starred?(@user)
  end
end
