class RecipesController < ApplicationController
  before_action :set_recipe, except: [:index]
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
  end

  private

  def set_recipe
    @recipe = Recipe.find params[:id]
  end
end
