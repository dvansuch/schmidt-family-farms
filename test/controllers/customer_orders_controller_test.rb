require 'test_helper'

class CustomerOrdersControllerTest < ActionController::TestCase
  setup do
    @customer_order = customer_orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customer_orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer_order" do
    assert_difference('CustomerOrder.count') do
      post :create, customer_order: { address: @customer_order.address, bbq_hog: @customer_order.bbq_hog, bbq_pit: @customer_order.bbq_pit, chickens: @customer_order.chickens, city: @customer_order.city, comments: @customer_order.comments, email: @customer_order.email, first_name: @customer_order.first_name, half_beef: @customer_order.half_beef, half_hog: @customer_order.half_hog, integer: @customer_order.integer, lamb: @customer_order.lamb, last_name: @customer_order.last_name, phone: @customer_order.phone, qtr_beef: @customer_order.qtr_beef, state: @customer_order.state, whole_beef: @customer_order.whole_beef, whole_hog: @customer_order.whole_hog, zip: @customer_order.zip }
    end

    assert_redirected_to customer_order_path(assigns(:customer_order))
  end

  test "should show customer_order" do
    get :show, id: @customer_order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer_order
    assert_response :success
  end

  test "should update customer_order" do
    patch :update, id: @customer_order, customer_order: { address: @customer_order.address, bbq_hog: @customer_order.bbq_hog, bbq_pit: @customer_order.bbq_pit, chickens: @customer_order.chickens, city: @customer_order.city, comments: @customer_order.comments, email: @customer_order.email, first_name: @customer_order.first_name, half_beef: @customer_order.half_beef, half_hog: @customer_order.half_hog, integer: @customer_order.integer, lamb: @customer_order.lamb, last_name: @customer_order.last_name, phone: @customer_order.phone, qtr_beef: @customer_order.qtr_beef, state: @customer_order.state, whole_beef: @customer_order.whole_beef, whole_hog: @customer_order.whole_hog, zip: @customer_order.zip }
    assert_redirected_to customer_order_path(assigns(:customer_order))
  end

  test "should destroy customer_order" do
    assert_difference('CustomerOrder.count', -1) do
      delete :destroy, id: @customer_order
    end

    assert_redirected_to customer_orders_path
  end
end
