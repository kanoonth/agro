require 'test_helper'

class PlanationsControllerTest < ActionController::TestCase
  setup do
    @planation = planations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:planations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create planation" do
    assert_difference('Planation.count') do
      post :create, planation: { name: @planation.name }
    end

    assert_redirected_to planation_path(assigns(:planation))
  end

  test "should show planation" do
    get :show, id: @planation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @planation
    assert_response :success
  end

  test "should update planation" do
    patch :update, id: @planation, planation: { name: @planation.name }
    assert_redirected_to planation_path(assigns(:planation))
  end

  test "should destroy planation" do
    assert_difference('Planation.count', -1) do
      delete :destroy, id: @planation
    end

    assert_redirected_to planations_path
  end
end
