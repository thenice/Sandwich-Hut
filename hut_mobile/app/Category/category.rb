# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Category
  include Rhom::PropertyBag
  
  enable :sync

  # Uncomment the following line to enable sync with Category.
  # enable :sync

  #add model specifc code here
  
  def menu_items
    MenuItem.find(:all, :conditions => {:category_id => self.object})
  end
  
end
