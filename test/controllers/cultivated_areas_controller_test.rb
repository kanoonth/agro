require 'test_helper'

class CultivatedAreasControllerTest < ActionController::TestCase
  setup do
    @cultivated_area = cultivated_areas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cultivated_areas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cultivated_area" do
    assert_difference('CultivatedArea.count') do
      post :create, cultivated_area: { latitude: @cultivated_area.latitude, longitude: @cultivated_area.longitude, name: @cultivated_area.name, plantation_date: @cultivated_area.plantation_date, plantation_id: @cultivated_area.plantation_id }
    end

    assert_redirected_to cultivated_area_path(assigns(:cultivated_area))
  end

  test "should show cultivated_area" do
    get :show, id: @cultivated_area
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cultivated_area
    assert_response :success
  end

  test "should update cultivated_area" do
    patch :update, id: @cultivated_area, cultivated_area: { latitude: @cultivated_area.latitude, longitude: @cultivated_area.longitude, name: @cultivated_area.name, plantation_date: @cultivated_area.plantation_date, plantation_id: @cultivated_area.plantation_id }
    assert_redirected_to cultivated_area_path(assigns(:cultivated_area))
  end

  test "should destroy cultivated_area" do
    assert_difference('CultivatedArea.count', -1) do
      delete :destroy, id: @cultivated_area
    end

    assert_redirected_to cultivated_areas_path
  end
end
