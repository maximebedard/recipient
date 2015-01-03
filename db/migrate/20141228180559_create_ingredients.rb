class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :description
      t.string :photo

      # Calculating units
      t.unit :calories
      t.unit :serving

      # Food components
      t.unit :fat
      t.unit :saturated_fat
      t.unit :trans_fat
      t.unit :cholesterol
      t.unit :sodium
      t.unit :carbohydrate
      t.unit :fibre
      t.unit :vitamin_a
      t.unit :vitamin_c
      t.unit :calcium
      t.unit :iron
      t.unit :sugar
      t.unit :protein

      t.timestamps
    end
  end
end
