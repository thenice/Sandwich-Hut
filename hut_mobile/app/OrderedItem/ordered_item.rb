# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here

require 'json'

class OrderedItem
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with OrderedItem.
  enable :sync
  
  @_menu_item = nil
  
  def menu_item
    puts "Setting the menu item"
     @_menu_item ||= MenuItem.find(self.menu_item_id)
  end
  
  def name
    self.menu_item.name
  end
  
  def calculate_total_price
    self.total = menu_item.price.to_f + extras_price.to_f
  end
  
  def extras_price
    sum = 0.0
    extra_ingredients.each do |ingredient_id|
      puts "extra: #{ingredient_id}"
      ingredient = Ingredient.find(ingredient_id.to_s)
      puts "Found ingredient: #{ingredient}"
      sum += ingredient.price.to_f
    end
    puts "extra price: #{sum}"
    return sum
  end
  
  def extra_ingredients
    ingredients_arr = Rho::JSON.parse(self.ingredients_json)
    default_ingredients_arr = Rho::JSON.parse(menu_item.menu_item_default.ingredients_json)
    extras = ingredients_arr - default_ingredients_arr
    puts "extra ingredients: #{extras.join(",")}"
    return extras
  end
  
  def ingredients
    menu_item.ingredients
  end  
  
  
  
  #add model specifc code here
end
