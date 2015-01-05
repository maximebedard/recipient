class CreateStarreds < ActiveRecord::Migration
  def change
    create_table :starreds do |t|
      t.references :starrable, polymorphic: true, index: true
      t.timestamps
    end
  end
end
