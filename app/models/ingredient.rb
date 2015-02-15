class Ingredient < ActiveRecord::Base
  include Taggable
  include HasNutritionFacts

  # Photo uploader (carrierware)
  mount_uploader :photo, PhotoUploader

  # Relations
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  # Validations
  validates :name, presence: true, uniqueness: true
end
