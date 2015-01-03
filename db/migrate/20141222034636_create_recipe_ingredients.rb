class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.unit :quantity
      t.timestamps
    end
  end
end
