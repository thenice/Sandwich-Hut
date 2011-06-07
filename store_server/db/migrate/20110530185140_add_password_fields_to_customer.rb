class AddPasswordFieldsToCustomer < ActiveRecord::Migration
  def self.up
    add_column :customers, :password_hash, :string
    add_column :customers, :password_salt, :string
  end

  def self.down
    remove_column :customers, :password_salt
    remove_column :customers, :password_hash
  end
end
