class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  unit_for :quantity, convert_to: :ingredient_serving_unit

  validates_presence_of :quantity, :ingredient, :recipe
  validates_unit_compatibility_of :quantity, with: :ingredient_serving_unit

  %w(
    calories
    fat
    saturated_fat
    trans_fat
    cholesterol
    sodium
    carbohydrate
    fibre
    sugar
    protein
    vitamin_a
    vitamin_c
    calcium
    iron
  ).each do |nutrient|
    define_method "total_#{nutrient}" do
      total_for(nutrient)
    end
  end

  def ingredient_serving_unit
    ingredient.serving.unit
  end

  private

  def total_for(nutrient)
    new_quantity = quantity.convert_to(ingredient.serving.unit)
    (new_quantity / ingredient.serving).value * ingredient.send(nutrient)
  rescue Unitwise::ConversionError
    nil
  end
end
