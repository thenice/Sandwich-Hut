class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :customer_id
      t.datetime :pick_up_at
      t.float :total
      t.boolean :is_delivery

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
