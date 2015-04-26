require 'test_helper'

class IngridientsPizzasControllerTest < ActionController::TestCase
  setup do
    @ingridients_pizza = ingridients_pizzas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingridients_pizzas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingridients_pizza" do
    assert_difference('IngridientsPizza.count') do
      post :create, ingridients_pizza: { ingridient_id: @ingridients_pizza.ingridient_id, pizza_id: @ingridients_pizza.pizza_id }
    end

    assert_redirected_to ingridients_pizza_path(assigns(:ingridients_pizza))
  end

  test "should show ingridients_pizza" do
    get :show, id: @ingridients_pizza
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingridients_pizza
    assert_response :success
  end

  test "should update ingridients_pizza" do
    patch :update, id: @ingridients_pizza, ingridients_pizza: { ingridient_id: @ingridients_pizza.ingridient_id, pizza_id: @ingridients_pizza.pizza_id }
    assert_redirected_to ingridients_pizza_path(assigns(:ingridients_pizza))
  end

  test "should destroy ingridients_pizza" do
    assert_difference('IngridientsPizza.count', -1) do
      delete :destroy, id: @ingridients_pizza
    end

    assert_redirected_to ingridients_pizzas_path
  end
end
