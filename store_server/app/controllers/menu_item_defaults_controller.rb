class MenuItemDefaultsController < ApplicationController
  # GET /menu_item_defaults
  # GET /menu_item_defaults.xml
  def index
    @menu_item_defaults = MenuItemDefault.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @menu_item_defaults }
      format.json  { render :json => @menu_item_defaults }
    end
  end

  # GET /menu_item_defaults/1
  # GET /menu_item_defaults/1.xml
  def show
    @menu_item_default = MenuItemDefault.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @menu_item_default }
      format.json  { render :json => @menu_item_default }
    end
  end

  # GET /menu_item_defaults/new
  # GET /menu_item_defaults/new.xml
  def new
    @menu_item_default = MenuItemDefault.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @menu_item_default }
      format.json  { render :json => @menu_item_default }
    end
  end

  # GET /menu_item_defaults/1/edit
  def edit
    @menu_item_default = MenuItemDefault.find(params[:id])
  end

  # POST /menu_item_defaults
  # POST /menu_item_defaults.xml
  def create
    @menu_item_default = MenuItemDefault.new(params[:menu_item_default])

    respond_to do |format|
      if @menu_item_default.save
        format.html { redirect_to(@menu_item_default, :notice => 'Menu item default was successfully created.') }
        format.xml  { render :xml => @menu_item_default, :status => :created, :location => @menu_item_default }
        format.json  { render :json => @menu_item_default, :status => :created, :location => @menu_item_default } 
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @menu_item_default.errors, :status => :unprocessable_entity }
        
      end
    end
  end

  # PUT /menu_item_defaults/1
  # PUT /menu_item_defaults/1.xml
  def update
    @menu_item_default = MenuItemDefault.find(params[:id])

    respond_to do |format|
      if @menu_item_default.update_attributes(params[:menu_item_default])
        format.html { redirect_to(@menu_item_default, :notice => 'Menu item default was successfully updated.') }
        format.xml  { head :ok }
        format.json  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @menu_item_default.errors, :status => :unprocessable_entity }
        format.json  { render :json => @menu_item_default.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_item_defaults/1
  # DELETE /menu_item_defaults/1.xml
  def destroy
    @menu_item_default = MenuItemDefault.find(params[:id])
    @menu_item_default.destroy

    respond_to do |format|
      format.html { redirect_to(menu_item_defaults_url) }
      format.xml  { head :ok }
      format.json  { head :ok }
    end
  end
end
