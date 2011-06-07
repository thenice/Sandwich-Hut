class CreateMenuItemDefaults < ActiveRecord::Migration
  def self.up
    create_table :menu_item_defaults do |t|
      t.integer :menu_item_id
      t.text :ingredients_json

      t.timestamps
    end
  end

  def self.down
    drop_table :menu_item_defaults
  end
end
