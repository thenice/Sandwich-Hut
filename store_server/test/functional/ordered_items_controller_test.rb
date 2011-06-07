require 'test_helper'

class OrderedItemsControllerTest < ActionController::TestCase
  setup do
    @ordered_item = ordered_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ordered_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ordered_item" do
    assert_difference('OrderedItem.count') do
      post :create, :ordered_item => @ordered_item.attributes
    end

    assert_redirected_to ordered_item_path(assigns(:ordered_item))
  end

  test "should show ordered_item" do
    get :show, :id => @ordered_item.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @ordered_item.to_param
    assert_response :success
  end

  test "should update ordered_item" do
    put :update, :id => @ordered_item.to_param, :ordered_item => @ordered_item.attributes
    assert_redirected_to ordered_item_path(assigns(:ordered_item))
  end

  test "should destroy ordered_item" do
    assert_difference('OrderedItem.count', -1) do
      delete :destroy, :id => @ordered_item.to_param
    end

    assert_redirected_to ordered_items_path
  end
end
