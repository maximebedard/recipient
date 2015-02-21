class AddPublishedToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :published, :bool
  end
end
