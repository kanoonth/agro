require 'test_helper'

class PlantationCertaintyFactorsControllerTest < ActionController::TestCase
  setup do
    @plantation_certainty_factor = plantation_certainty_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:plantation_certainty_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create plantation_certainty_factor" do
    assert_difference('PlantationCertaintyFactor.count') do
      post :create, plantation_certainty_factor: { cf: @plantation_certainty_factor.cf, disease_id: @plantation_certainty_factor.disease_id, plantation_id: @plantation_certainty_factor.plantation_id }
    end

    assert_redirected_to plantation_certainty_factor_path(assigns(:plantation_certainty_factor))
  end

  test "should show plantation_certainty_factor" do
    get :show, id: @plantation_certainty_factor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @plantation_certainty_factor
    assert_response :success
  end

  test "should update plantation_certainty_factor" do
    patch :update, id: @plantation_certainty_factor, plantation_certainty_factor: { cf: @plantation_certainty_factor.cf, disease_id: @plantation_certainty_factor.disease_id, plantation_id: @plantation_certainty_factor.plantation_id }
    assert_redirected_to plantation_certainty_factor_path(assigns(:plantation_certainty_factor))
  end

  test "should destroy plantation_certainty_factor" do
    assert_difference('PlantationCertaintyFactor.count', -1) do
      delete :destroy, id: @plantation_certainty_factor
    end

    assert_redirected_to plantation_certainty_factors_path
  end
end
