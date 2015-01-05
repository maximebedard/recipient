class CreateTaggables < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.timestamps
    end
    create_table :taggings do |t|
      t.belongs_to :taggable, polymorphic: true, index: true
      t.belongs_to :tag
    end
  end
end
