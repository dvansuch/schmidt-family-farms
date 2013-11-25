require 'test_helper'

class FarmCustomersControllerTest < ActionController::TestCase
  setup do
    @farm_customer = farm_customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:farm_customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create farm_customer" do
    assert_difference('FarmCustomer.count') do
      post :create, farm_customer: {  }
    end

    assert_redirected_to farm_customer_path(assigns(:farm_customer))
  end

  test "should show farm_customer" do
    get :show, id: @farm_customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @farm_customer
    assert_response :success
  end

  test "should update farm_customer" do
    patch :update, id: @farm_customer, farm_customer: {  }
    assert_redirected_to farm_customer_path(assigns(:farm_customer))
  end

  test "should destroy farm_customer" do
    assert_difference('FarmCustomer.count', -1) do
      delete :destroy, id: @farm_customer
    end

    assert_redirected_to farm_customers_path
  end
end
