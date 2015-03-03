require 'test_helper'

class RegionCertaintyFactorsControllerTest < ActionController::TestCase
  setup do
    @region_certainty_factor = region_certainty_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:region_certainty_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create region_certainty_factor" do
    assert_difference('RegionCertaintyFactor.count') do
      post :create, region_certainty_factor: { disease_id: @region_certainty_factor.disease_id, region_id: @region_certainty_factor.region_id }
    end

    assert_redirected_to region_certainty_factor_path(assigns(:region_certainty_factor))
  end

  test "should show region_certainty_factor" do
    get :show, id: @region_certainty_factor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @region_certainty_factor
    assert_response :success
  end

  test "should update region_certainty_factor" do
    patch :update, id: @region_certainty_factor, region_certainty_factor: { disease_id: @region_certainty_factor.disease_id, region_id: @region_certainty_factor.region_id }
    assert_redirected_to region_certainty_factor_path(assigns(:region_certainty_factor))
  end

  test "should destroy region_certainty_factor" do
    assert_difference('RegionCertaintyFactor.count', -1) do
      delete :destroy, id: @region_certainty_factor
    end

    assert_redirected_to region_certainty_factors_path
  end
end
