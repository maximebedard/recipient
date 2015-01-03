class Recipe < ActiveRecord::Base

  # Relations
  has_many :instructions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :categories
  mount_uploaders :photos, PhotoUploader

  belongs_to :user

  validates_presence_of :name
end
