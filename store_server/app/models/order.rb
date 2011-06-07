class Order < ActiveRecord::Base
  has_many :ordered_items
  belongs_to :customer
end
