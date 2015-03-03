require 'test_helper'

class SoilTypesControllerTest < ActionController::TestCase
  setup do
    @soil_type = soil_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soil_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soil_type" do
    assert_difference('SoilType.count') do
      post :create, soil_type: { name: @soil_type.name }
    end

    assert_redirected_to soil_type_path(assigns(:soil_type))
  end

  test "should show soil_type" do
    get :show, id: @soil_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soil_type
    assert_response :success
  end

  test "should update soil_type" do
    patch :update, id: @soil_type, soil_type: { name: @soil_type.name }
    assert_redirected_to soil_type_path(assigns(:soil_type))
  end

  test "should destroy soil_type" do
    assert_difference('SoilType.count', -1) do
      delete :destroy, id: @soil_type
    end

    assert_redirected_to soil_types_path
  end
end
