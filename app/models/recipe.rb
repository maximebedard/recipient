class Recipe < ActiveRecord::Base
  include Taggable

  # Photo uploader (carrierware)
  mount_uploaders :photos, PhotoUploader

  # Relations
  has_many :instructions

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  belongs_to :user

  validates_presence_of :name, :description
end
