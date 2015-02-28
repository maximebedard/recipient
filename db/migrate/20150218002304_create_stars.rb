class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.references :starrable, polymorphic: true
      t.references :user
      t.timestamps
    end
  end
end
