require 'rho/rhocontroller'
require 'helpers/browser_helper'

class MenuItemDefaultController < Rho::RhoController
  include BrowserHelper

  #GET /MenuItemDefault
  def index
    @menuitemdefaults = MenuItemDefault.find(:all)
    render :back => '/app'
  end

  # GET /MenuItemDefault/{1}
  def show
    @menuitemdefault = MenuItemDefault.find(@params['id'])
    if @menuitemdefault
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /MenuItemDefault/new
  def new
    @menuitemdefault = MenuItemDefault.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /MenuItemDefault/{1}/edit
  def edit
    @menuitemdefault = MenuItemDefault.find(@params['id'])
    if @menuitemdefault
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /MenuItemDefault/create
  def create
    @menuitemdefault = MenuItemDefault.create(@params['menuitemdefault'])
    redirect :action => :index
  end

  # POST /MenuItemDefault/{1}/update
  def update
    @menuitemdefault = MenuItemDefault.find(@params['id'])
    @menuitemdefault.update_attributes(@params['menuitemdefault']) if @menuitemdefault
    redirect :action => :index
  end

  # POST /MenuItemDefault/{1}/delete
  def delete
    @menuitemdefault = MenuItemDefault.find(@params['id'])
    @menuitemdefault.destroy if @menuitemdefault
    redirect :action => :index  end
end
