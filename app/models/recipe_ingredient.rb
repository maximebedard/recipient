class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient

  unit_for :quantity

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

    define_method "total_#{nutrient}!" do
      total_for!(nutrient)
    end
  end

  def ingredient_serving_unit
    ingredient.serving.unit
  end

  def convert_quantity_to_match_ingredient
    quantity.convert_to(ingredient_serving_unit)
  end

  private

  def total_for(nutrient)
    total_for!(nutrient)
  rescue Unitwise::ConversionError
    nil
  end

  def total_for!(nutrient)
    (convert_quantity_to_match_ingredient / ingredient.serving).value * ingredient.send(nutrient)
  end
end
