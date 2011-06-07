module MenuItemDefaultsHelper
  
  def ingredients_string(menu_item)
    menu_item.ingredients.collect { |m| m.name }.join(", ")
  end
  
end
