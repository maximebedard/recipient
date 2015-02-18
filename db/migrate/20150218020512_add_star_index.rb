class AddStarIndex < ActiveRecord::Migration
  def change
    add_index :stars, [:user_id, :starrable_id, :starrable_type],
              unique: true, name: 'by_user_and_starrable'
  end
end
