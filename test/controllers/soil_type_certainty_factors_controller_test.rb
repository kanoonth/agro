require 'test_helper'

class SoilTypeCertaintyFactorsControllerTest < ActionController::TestCase
  setup do
    @soil_type_certainty_factor = soil_type_certainty_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soil_type_certainty_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soil_type_certainty_factor" do
    assert_difference('SoilTypeCertaintyFactor.count') do
      post :create, soil_type_certainty_factor: { disease_id: @soil_type_certainty_factor.disease_id, soil_type_id: @soil_type_certainty_factor.soil_type_id }
    end

    assert_redirected_to soil_type_certainty_factor_path(assigns(:soil_type_certainty_factor))
  end

  test "should show soil_type_certainty_factor" do
    get :show, id: @soil_type_certainty_factor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soil_type_certainty_factor
    assert_response :success
  end

  test "should update soil_type_certainty_factor" do
    patch :update, id: @soil_type_certainty_factor, soil_type_certainty_factor: { disease_id: @soil_type_certainty_factor.disease_id, soil_type_id: @soil_type_certainty_factor.soil_type_id }
    assert_redirected_to soil_type_certainty_factor_path(assigns(:soil_type_certainty_factor))
  end

  test "should destroy soil_type_certainty_factor" do
    assert_difference('SoilTypeCertaintyFactor.count', -1) do
      delete :destroy, id: @soil_type_certainty_factor
    end

    assert_redirected_to soil_type_certainty_factors_path
  end
end
