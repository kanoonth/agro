require 'test_helper'

class EcologyCertaintyFactorsControllerTest < ActionController::TestCase
  setup do
    @ecology_certainty_factor = ecology_certainty_factors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ecology_certainty_factors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ecology_certainty_factor" do
    assert_difference('EcologyCertaintyFactor.count') do
      post :create, ecology_certainty_factor: { cf: @ecology_certainty_factor.cf, disease_id: @ecology_certainty_factor.disease_id, ecology_id: @ecology_certainty_factor.ecology_id }
    end

    assert_redirected_to ecology_certainty_factor_path(assigns(:ecology_certainty_factor))
  end

  test "should show ecology_certainty_factor" do
    get :show, id: @ecology_certainty_factor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ecology_certainty_factor
    assert_response :success
  end

  test "should update ecology_certainty_factor" do
    patch :update, id: @ecology_certainty_factor, ecology_certainty_factor: { cf: @ecology_certainty_factor.cf, disease_id: @ecology_certainty_factor.disease_id, ecology_id: @ecology_certainty_factor.ecology_id }
    assert_redirected_to ecology_certainty_factor_path(assigns(:ecology_certainty_factor))
  end

  test "should destroy ecology_certainty_factor" do
    assert_difference('EcologyCertaintyFactor.count', -1) do
      delete :destroy, id: @ecology_certainty_factor
    end

    assert_redirected_to ecology_certainty_factors_path
  end
end
