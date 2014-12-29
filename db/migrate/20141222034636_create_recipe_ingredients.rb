class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :value
      t.string :unit
      t.timestamps
    end
  end
end
