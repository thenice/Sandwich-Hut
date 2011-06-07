class CreateOrderedItems < ActiveRecord::Migration
  def self.up
    create_table :ordered_items do |t|
      t.integer :menu_item_id
      t.integer :order_id
      t.text :ingredients_json
      t.float :total
      t.text :special_instructions
      t.string :status
      t.timestamps
    end
  end

  def self.down
    drop_table :ordered_items
  end
end
