class RecipesController < ApplicationController
  before_action :set_recipe, except: [:index, :new]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.build
  end

  def create; end

  def update; end

  def destroy; end

  def show; end

  private

  def set_recipe
    @recipe = Recipe.find params[:id]
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
