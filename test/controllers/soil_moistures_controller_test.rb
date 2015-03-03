require 'test_helper'

class SoilMoisturesControllerTest < ActionController::TestCase
  setup do
    @soil_moisture = soil_moistures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soil_moistures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soil_moisture" do
    assert_difference('SoilMoisture.count') do
      post :create, soil_moisture: { cf: @soil_moisture.cf, disease_id: @soil_moisture.disease_id, max: @soil_moisture.max, min: @soil_moisture.min }
    end

    assert_redirected_to soil_moisture_path(assigns(:soil_moisture))
  end

  test "should show soil_moisture" do
    get :show, id: @soil_moisture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soil_moisture
    assert_response :success
  end

  test "should update soil_moisture" do
    patch :update, id: @soil_moisture, soil_moisture: { cf: @soil_moisture.cf, disease_id: @soil_moisture.disease_id, max: @soil_moisture.max, min: @soil_moisture.min }
    assert_redirected_to soil_moisture_path(assigns(:soil_moisture))
  end

  test "should destroy soil_moisture" do
    assert_difference('SoilMoisture.count', -1) do
      delete :destroy, id: @soil_moisture
    end

    assert_redirected_to soil_moistures_path
  end
end
