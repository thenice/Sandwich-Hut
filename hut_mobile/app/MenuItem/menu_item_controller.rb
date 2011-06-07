require 'rho/rhocontroller'
require 'helpers/browser_helper'

class MenuItemController < Rho::RhoController
  include BrowserHelper

  #GET /MenuItem
  def index
    @menuitems = MenuItem.find(:all)
    render :back => '/app'
  end

  # GET /MenuItem/{1}
  def show
    @menuitem = MenuItem.find(@params['id'])
    @selected = @menuitem.ingredients.collect { |i| i.object }
    if @menuitem
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /MenuItem/new
  def new
    @menuitem = MenuItem.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /MenuItem/{1}/edit
  def edit
    @menuitem = MenuItem.find(@params['id'])
    if @menuitem
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /MenuItem/create
  def create
    @menuitem = MenuItem.create(@params['menuitem'])
    redirect :action => :index
  end

  # POST /MenuItem/{1}/update
  def update
    @menuitem = MenuItem.find(@params['id'])
    @menuitem.update_attributes(@params['menuitem']) if @menuitem
    redirect :action => :index
  end

  # POST /MenuItem/{1}/delete
  def delete
    @menuitem = MenuItem.find(@params['id'])
    @menuitem.destroy if @menuitem
    redirect :action => :index  end
end
