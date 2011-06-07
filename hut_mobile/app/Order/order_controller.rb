require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'time'

class OrderController < Rho::RhoController
  include BrowserHelper
  
  $saved = nil
  $choosed = {}

  $datemin = Time.at(0)
  $datemax = Time.at(0)

  $datemin_s = ''
  $datemax_s = ''
  
  #GET /Order
  def index
    @orders = Order.find(:all)
    render :back => '/app'
  end

  # GET /Order/{1}
  def show
    @order = Order.find(@params['id'])
    if @order
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Order/new
  def new
    if ::Rho.get_app.is_ordering?
      @order = ::Rho.get_app.current_order
    else
      @order = Order.new
      @order.status = "new"
      @order.save
      session = ::Rho.get_app.current_order=@order
    end
    puts @order
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Order/{1}/edit
  def edit
    @order = Order.find(@params['id'])
    if @order
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Order/create
  def create
    @order = Order.create(@params['order'])
    redirect :action => :index
  end

  # POST /Order/{1}/update
  def update
    @order = Order.find(@params['id'])
    @order.update_attributes(@params['order']) if @order
    redirect :action => :index
  end

  # POST /Order/{1}/delete
  def delete
    @order = Order.find(@params['id'])
    @order.destroy if @order
    redirect :action => :index
  end
  
   # ---- DateTime Picker ---- #
   
   def choose
      puts "Choose date/time"

      flag = @params['flag']
      title = @params['title']

      if flag == '0' or flag == '1' or flag == '2'
        $saved = nil
        # preset_time = Time.parse("2009-10-20 14:30:00")
        # puts "Parsed Time Object: #{preset_time.inspect.to_s}"
        # DateTimePicker.choose( url_for( :action => :datetime_callback ), title, preset_time, flag.to_i, Marshal.dump(flag) )

        ttt = $choosed[flag]
        if ttt.nil?
          preset_time = Time.new
        else
          preset_time = Time.parse(ttt)  
        end


        DateTimePicker.choose_with_range( url_for( :action => :datetime_callback ), title, preset_time, flag.to_i, Marshal.dump(flag), $datemin, $datemax )
      end
      redirect :action => :new
      ""
    end
 
   def datetime_callback
     puts "datetime_callback"

     $status = @params['status']
     if $status == 'ok'
       $dt = Time.at( @params['result'].to_i )
       flag = Marshal.load(@params['opaque'])
       format = case flag
         when "0" then '%F %T'
         when "1" then '%F'
         when "2" then '%T'
         else '%F %T'
       end
       $choosed[flag] = $dt.strftime( format )
       #WebView::refresh
     end

     #WebView.navigate( url_for :action => :index )

     #reply on the callback
     #render :action => :index
     ""
   end


   
end
