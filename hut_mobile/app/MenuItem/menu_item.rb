class MenuItem
  include Rhom::PropertyBag
  enable :sync

  @_menu_item_default = nil
  
  def ingredients
    default = MenuItemDefault.find(:first, :conditions => {:menu_item_id => self.object})
    ingredient_arr = Rho::JSON.parse(default.ingredients_json)
    ingredients = []
    ingredient_arr.each do |ingredient_id|
      ingredients << Ingredient.find(ingredient_id.to_s)
    end
    return ingredients
  end
  
  def menu_item_default
    @_menu_item_default = MenuItemDefault.find(:first, :conditions => { :menu_item_id => self.object})
  end
  
end
