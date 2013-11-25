require 'test_helper'

class FarmOrdersControllerTest < ActionController::TestCase
  setup do
    @farm_order = farm_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:farm_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create farm_order" do
    assert_difference('FarmOrder.count') do
      post :create, farm_order: {  }
    end

    assert_redirected_to farm_order_path(assigns(:farm_order))
  end

  test "should show farm_order" do
    get :show, id: @farm_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @farm_order
    assert_response :success
  end

  test "should update farm_order" do
    patch :update, id: @farm_order, farm_order: {  }
    assert_redirected_to farm_order_path(assigns(:farm_order))
  end

  test "should destroy farm_order" do
    assert_difference('FarmOrder.count', -1) do
      delete :destroy, id: @farm_order
    end

    assert_redirected_to farm_orders_path
  end
end
