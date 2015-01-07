class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      t.string :photo
      t.integer :preperation_time
      t.integer :total_time
      t.integer :serving
      t.references :user
      t.timestamps
    end
  end
end
