class Recipe < ActiveRecord::Base
  include Taggable
  include Starrable
  include HasNutritionFacts

  mount_uploader :photo, PhotoUploader

  has_many :instructions
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  belongs_to :user

  validates :name, :description, presence: true

  scope :published, -> { where(published: true) }
end
