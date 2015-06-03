class Recipe < ActiveRecord::Base
  include Starrable
  include HasNutrients

  has_many :instructions
  has_many :recipe_items
  has_many :ingredients, through: :recipe_items

  belongs_to :user

  validates :name, :description, presence: true

  scope :published, -> { where(published: true) }
end
