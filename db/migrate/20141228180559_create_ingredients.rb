class CreateIngredients < ActiveRecord::Migration

  def change
    create_table :ingredients do |t|

      t.string :name

      t.decimal :serving_value,      precision: 6, scale: 1, default: 0
      t.decimal :calories_value,      precision: 6, scale: 1, default: 0
      t.decimal :carbohydrates_value, precision: 6, scale: 1, default: 0
      t.decimal :fat_value,           precision: 6, scale: 1, default: 0
      t.decimal :proteins_value,      precision: 6, scale: 1, default: 0

      t.string :serving_unit
      t.string :calories_unit
      t.string :carbohydrates_unit
      t.string :fat_unit
      t.string :proteins_unit

      t.decimal :calories_daily_value,      precision: 3, scale: 2
      t.decimal :carbohydrates_daily_value, precision: 3, scale: 2
      t.decimal :fat_daily_value,           precision: 3, scale: 2
      t.decimal :proteins_daily_value,      precision: 3, scale: 2


      t.timestamps
    end
  end
end
