require 'rho/rhocontroller'
require 'helpers/browser_helper'

class IngredientController < Rho::RhoController
  include BrowserHelper

  #GET /Ingredient
  def index
    @ingredients = Ingredient.find(:all)
    render :back => '/app'
  end

  # GET /Ingredient/{1}
  def show
    @ingredient = Ingredient.find(@params['id'])
    if @ingredient
      render :action => :show, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # GET /Ingredient/new
  def new
    @ingredient = Ingredient.new
    render :action => :new, :back => url_for(:action => :index)
  end

  # GET /Ingredient/{1}/edit
  def edit
    @ingredient = Ingredient.find(@params['id'])
    if @ingredient
      render :action => :edit, :back => url_for(:action => :index)
    else
      redirect :action => :index
    end
  end

  # POST /Ingredient/create
  def create
    @ingredient = Ingredient.create(@params['ingredient'])
    redirect :action => :index
  end

  # POST /Ingredient/{1}/update
  def update
    @ingredient = Ingredient.find(@params['id'])
    @ingredient.update_attributes(@params['ingredient']) if @ingredient
    redirect :action => :index
  end

  # POST /Ingredient/{1}/delete
  def delete
    @ingredient = Ingredient.find(@params['id'])
    @ingredient.destroy if @ingredient
    redirect :action => :index  end
end
