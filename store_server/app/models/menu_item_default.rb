class MenuItemDefault < ActiveRecord::Base
  belongs_to :menu_item
  
  def ingredients
    Ingredient.find(JSON.parse(ingredients_json))
  end
  
end
