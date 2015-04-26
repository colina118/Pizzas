require 'test_helper'

class OrdersPizzasControllerTest < ActionController::TestCase
  setup do
    @orders_pizza = orders_pizzas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders_pizzas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create orders_pizza" do
    assert_difference('OrdersPizza.count') do
      post :create, orders_pizza: { order_id: @orders_pizza.order_id, pizza_id: @orders_pizza.pizza_id }
    end

    assert_redirected_to orders_pizza_path(assigns(:orders_pizza))
  end

  test "should show orders_pizza" do
    get :show, id: @orders_pizza
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @orders_pizza
    assert_response :success
  end

  test "should update orders_pizza" do
    patch :update, id: @orders_pizza, orders_pizza: { order_id: @orders_pizza.order_id, pizza_id: @orders_pizza.pizza_id }
    assert_redirected_to orders_pizza_path(assigns(:orders_pizza))
  end

  test "should destroy orders_pizza" do
    assert_difference('OrdersPizza.count', -1) do
      delete :destroy, id: @orders_pizza
    end

    assert_redirected_to orders_pizzas_path
  end
end
