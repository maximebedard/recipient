class CreateInstructions < ActiveRecord::Migration
  def change
    create_table :instructions do |t|
      t.integer :order
      t.text :description
      t.timestamps
    end
  end
end
