require 'test_helper'

class MenuItemDefaultsControllerTest < ActionController::TestCase
  setup do
    @menu_item_default = menu_item_defaults(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:menu_item_defaults)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create menu_item_default" do
    assert_difference('MenuItemDefault.count') do
      post :create, :menu_item_default => @menu_item_default.attributes
    end

    assert_redirected_to menu_item_default_path(assigns(:menu_item_default))
  end

  test "should show menu_item_default" do
    get :show, :id => @menu_item_default.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @menu_item_default.to_param
    assert_response :success
  end

  test "should update menu_item_default" do
    put :update, :id => @menu_item_default.to_param, :menu_item_default => @menu_item_default.attributes
    assert_redirected_to menu_item_default_path(assigns(:menu_item_default))
  end

  test "should destroy menu_item_default" do
    assert_difference('MenuItemDefault.count', -1) do
      delete :destroy, :id => @menu_item_default.to_param
    end

    assert_redirected_to menu_item_defaults_path
  end
end
