require 'test_helper'

class AirMoisturesControllerTest < ActionController::TestCase
  setup do
    @air_moisture = air_moistures(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:air_moistures)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create air_moisture" do
    assert_difference('AirMoisture.count') do
      post :create, air_moisture: { cf: @air_moisture.cf, disease_id: @air_moisture.disease_id, max: @air_moisture.max, min: @air_moisture.min }
    end

    assert_redirected_to air_moisture_path(assigns(:air_moisture))
  end

  test "should show air_moisture" do
    get :show, id: @air_moisture
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @air_moisture
    assert_response :success
  end

  test "should update air_moisture" do
    patch :update, id: @air_moisture, air_moisture: { cf: @air_moisture.cf, disease_id: @air_moisture.disease_id, max: @air_moisture.max, min: @air_moisture.min }
    assert_redirected_to air_moisture_path(assigns(:air_moisture))
  end

  test "should destroy air_moisture" do
    assert_difference('AirMoisture.count', -1) do
      delete :destroy, id: @air_moisture
    end

    assert_redirected_to air_moistures_path
  end
end
