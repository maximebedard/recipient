class Recipe < ActiveRecord::Base

  # Relations
  has_many :instructions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :photos
  has_many :categories

  def total_calories
    ingredients.sum(:calories)
  end

  

end
