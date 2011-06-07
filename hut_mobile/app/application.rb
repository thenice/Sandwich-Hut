require 'rho/rhoapplication'

class AppApplication < Rho::RhoApplication
  
  def initialize
    # Tab items are loaded left->right, @tabs[0] is leftmost tab in the tab-bar
    # Super must be called *after* settings @tabs!
    @tabs = [
          { :label => "Menu", :action => '/app/MenuItem/',
            :reload => true, :web_bkg_color => 0x7F7F7F }, 
          { :label => "Place Order",  :action => '/app/Order/new',
            :reload => true, :web_bkg_color => 0x7F7F7F },
          { :label => "Order History",  :action => '/app/Order/',
            :reload => true, :web_bkg_color => 0x7F7F7F },
          { :label => "My Account", :action => '/app/Customer/', 
            :reload => true, :web_bkg_color => 0x7F7F7F },
            { :label => "My Account", :action => '/app/Customer/', 
              :reload => true, :web_bkg_color => 0x7F7F7F }
            ]
    #To remove default toolbar uncomment next line:
    #@@toolbar = nil
    
    # the order that is in progress
    @current_order = nil
    
    super

    # Uncomment to set sync notification callback to /app/Settings/sync_notify.
    # SyncEngine::set_objectnotify_url("/app/Settings/sync_notify")
    # SyncEngine.set_notification(-1, "/app/Settings/sync_notify", '')
  end
  
  def current_order=(order)
    @current_order = order
  end
  
  def current_order
    @current_order
  end
  
  def is_ordering?
    @current_order == nil ? false : true
  end
  
  def done_ordering!
    @current_order == nil
  end
  
  
  
  
end
