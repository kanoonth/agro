require 'test_helper'

class AreaTypeCertaintyFactorsControllerTest < ActionController::TestCase
  setup do
    @area_type_certainty_factor = area_type_certainty_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:area_type_certainty_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create area_type_certainty_factor" do
    assert_difference('AreaTypeCertaintyFactor.count') do
      post :create, area_type_certainty_factor: { area_type_id: @area_type_certainty_factor.area_type_id, cf: @area_type_certainty_factor.cf, disease_id: @area_type_certainty_factor.disease_id }
    end

    assert_redirected_to area_type_certainty_factor_path(assigns(:area_type_certainty_factor))
  end

  test "should show area_type_certainty_factor" do
    get :show, id: @area_type_certainty_factor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @area_type_certainty_factor
    assert_response :success
  end

  test "should update area_type_certainty_factor" do
    patch :update, id: @area_type_certainty_factor, area_type_certainty_factor: { area_type_id: @area_type_certainty_factor.area_type_id, cf: @area_type_certainty_factor.cf, disease_id: @area_type_certainty_factor.disease_id }
    assert_redirected_to area_type_certainty_factor_path(assigns(:area_type_certainty_factor))
  end

  test "should destroy area_type_certainty_factor" do
    assert_difference('AreaTypeCertaintyFactor.count', -1) do
      delete :destroy, id: @area_type_certainty_factor
    end

    assert_redirected_to area_type_certainty_factors_path
  end
end
