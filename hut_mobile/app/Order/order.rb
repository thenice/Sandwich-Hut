# The model has already been created by the framework, and extends Rhom::RhomObject
# You can add more methods here
class Order
  include Rhom::PropertyBag

  # Uncomment the following line to enable sync with Order.
  enable :sync

  def ordered_items
    OrderedItem.find(:all, :conditions => {:order_id => self.object})
  end
  
  def order_total
    total = ordered_items.inject(0.0) { |sum,item| sum += (item.total.to_f || 0) }
    total += tax
    total += delivery_charge
    total += fees
  end
  
  # add tax, fees, and delivery charge logic here
  def tax
    0.0
  end
  
  def delivery_charge
    0.0
  end
  
  def fees
    0.0
  end
  
end
