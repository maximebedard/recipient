class CreateRecipeItems < ActiveRecord::Migration
  def change
    create_table :recipe_items do |t|
      t.references :ingredient
      t.references :recipe
      t.unit :quantity
      t.timestamps
    end
  end
end
