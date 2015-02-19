class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.build
  end

  def create
  end

  def update
  end

  def destroy
  end

  def show
    @recipe = Recipe.find params[:id]
  end

  def starred
    if current_user?
      star = @recipe.toggle_starred(current_user)
      render :show, flash: { notice: 'wat' }
    else
      render :show, flash: { notice: I18n.t('devise.unauthenticated') }
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
