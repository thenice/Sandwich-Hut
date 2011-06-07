class MenuItem < ActiveRecord::Base
  belongs_to :category
  has_one :menu_item_default
  has_many :ordered_items
  
  def ingredients
    menu_item_default.ingredients rescue []
  end
  
end
