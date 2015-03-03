require 'test_helper'

class PotassiaControllerTest < ActionController::TestCase
  setup do
    @potassium = potassia(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:potassia)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create potassium" do
    assert_difference('Potassium.count') do
      post :create, potassium: { cf: @potassium.cf, disease_id: @potassium.disease_id, max: @potassium.max, min: @potassium.min, stage_id: @potassium.stage_id }
    end

    assert_redirected_to potassium_path(assigns(:potassium))
  end

  test "should show potassium" do
    get :show, id: @potassium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @potassium
    assert_response :success
  end

  test "should update potassium" do
    patch :update, id: @potassium, potassium: { cf: @potassium.cf, disease_id: @potassium.disease_id, max: @potassium.max, min: @potassium.min, stage_id: @potassium.stage_id }
    assert_redirected_to potassium_path(assigns(:potassium))
  end

  test "should destroy potassium" do
    assert_difference('Potassium.count', -1) do
      delete :destroy, id: @potassium
    end

    assert_redirected_to potassia_path
  end
end
