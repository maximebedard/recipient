class RecipesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_recipe, except: [:index, :new]

  def index
    @recipes = Recipe.all.published
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
  end

  def starred
    star = @recipe.toggle_starred(current_user)
    respond_to do |f|
      f.js   # starred.js.erb
      f.json { render json: star }
    end
  end

  def publish
    if @recipe.toggle!(:published)
      redirect_to recipes_path
    else
      render :new
    end
  end

  private

  def set_recipe
    @recipe = Recipe.find params[:id]
  end

  def recipe_params
    params.require(:recipe).permit(:name, :description)
  end
end
