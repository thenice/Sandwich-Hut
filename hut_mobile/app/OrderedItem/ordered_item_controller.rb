require 'rho/rhocontroller'
require 'helpers/browser_helper'
require 'json'

class OrderedItemController < Rho::RhoController
  include BrowserHelper

  #GET /OrderedItem
  def index
    @ordereditems = OrderedItem.find(:all)
    render :back => '/app'
  end

  # GET /OrderedItem/{1}
  def show
    @ordereditem = OrderedItem.find(@params['id'])
    @menuitem = @ordereditem.menu_item
    @selected = @ordereditem.ingredients_json
    if @ordereditem
      render :controller => :MenuItem, :action => :show, :back => url_for(:controller => :OrderedItem, :action => :new)
    else
      redirect :action => :index
    end
  end

  # GET /OrderedItem/new
  def new
    @ordereditem = OrderedItem.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /OrderedItem/{1}/edit
  def edit
    @ordereditem = OrderedItem.find(@params['id'])
    @menuitem = @ordereditem.menu_item
    @selected = @ordereditem.ingredients_json
    if @ordereditem
      render :action => :edit, :back => url_for(:controller => :OrderedItem, :action => :new)
    else
      redirect :action => :index
    end
  end

  # POST /OrderedItem/create
  def create
    @ordereditem = OrderedItem.new(@params['ordereditem'])
    update_ingredients_and_price
    @ordereditem.save
    redirect :controller => :Order, :action => :new
  end

  # POST /OrderedItem/{1}/update
  def update
    @ordereditem = OrderedItem.find(@params['id'])
    @ordereditem.update_attributes(@params['ordereditem']) if @ordereditem
    update_ingredients_and_price
    @ordereditem.save
    redirect :controller => :Order, :action => :new
  end

  # POST /OrderedItem/{1}/delete
  def delete
    @ordereditem = OrderedItem.find(@params['id'])
    @ordereditem.destroy if @ordereditem
    redirect :action => :index
  end
  
  def update_ingredients_and_price
    @ordereditem.ingredients_json = "[#{@params['ingredients_json'].join(',')}]"
    @ordereditem.calculate_total_price
  end
  
end
