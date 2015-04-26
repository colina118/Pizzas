require 'test_helper'

class IngridientsControllerTest < ActionController::TestCase
  setup do
    @ingridient = ingridients(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ingridients)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ingridient" do
    assert_difference('Ingridient.count') do
      post :create, ingridient: { name: @ingridient.name, price: @ingridient.price }
    end

    assert_redirected_to ingridient_path(assigns(:ingridient))
  end

  test "should show ingridient" do
    get :show, id: @ingridient
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ingridient
    assert_response :success
  end

  test "should update ingridient" do
    patch :update, id: @ingridient, ingridient: { name: @ingridient.name, price: @ingridient.price }
    assert_redirected_to ingridient_path(assigns(:ingridient))
  end

  test "should destroy ingridient" do
    assert_difference('Ingridient.count', -1) do
      delete :destroy, id: @ingridient
    end

    assert_redirected_to ingridients_path
  end
end
