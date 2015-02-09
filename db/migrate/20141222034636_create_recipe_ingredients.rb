class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.references :ingredient
      t.references :recipe
      t.unit :quantity
      t.timestamps
    end
  end
end
