class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.string :description
      #t.json :photos
      t.references :user
      t.timestamps
    end
  end
end
