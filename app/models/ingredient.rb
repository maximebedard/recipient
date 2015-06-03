class Ingredient < ActiveRecord::Base
  include HasNutrients
  include Starrable

  # Relations
  has_many :recipe_items
  has_many :recipes, through: :recipe_items

  # Validations
  validates :name, presence: true, uniqueness: true
end
