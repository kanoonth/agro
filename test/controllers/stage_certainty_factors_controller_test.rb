require 'test_helper'

class StageCertaintyFactorsControllerTest < ActionController::TestCase
  setup do
    @stage_certainty_factor = stage_certainty_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stage_certainty_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stage_certainty_factor" do
    assert_difference('StageCertaintyFactor.count') do
      post :create, stage_certainty_factor: { cf: @stage_certainty_factor.cf, disease_id: @stage_certainty_factor.disease_id, stage_id: @stage_certainty_factor.stage_id }
    end

    assert_redirected_to stage_certainty_factor_path(assigns(:stage_certainty_factor))
  end

  test "should show stage_certainty_factor" do
    get :show, id: @stage_certainty_factor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stage_certainty_factor
    assert_response :success
  end

  test "should update stage_certainty_factor" do
    patch :update, id: @stage_certainty_factor, stage_certainty_factor: { cf: @stage_certainty_factor.cf, disease_id: @stage_certainty_factor.disease_id, stage_id: @stage_certainty_factor.stage_id }
    assert_redirected_to stage_certainty_factor_path(assigns(:stage_certainty_factor))
  end

  test "should destroy stage_certainty_factor" do
    assert_difference('StageCertaintyFactor.count', -1) do
      delete :destroy, id: @stage_certainty_factor
    end

    assert_redirected_to stage_certainty_factors_path
  end
end
