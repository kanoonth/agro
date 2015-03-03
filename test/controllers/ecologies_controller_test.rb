require 'test_helper'

class EcologiesControllerTest < ActionController::TestCase
  setup do
    @ecology = ecologies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ecologies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ecology" do
    assert_difference('Ecology.count') do
      post :create, ecology: { name: @ecology.name }
    end

    assert_redirected_to ecology_path(assigns(:ecology))
  end

  test "should show ecology" do
    get :show, id: @ecology
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ecology
    assert_response :success
  end

  test "should update ecology" do
    patch :update, id: @ecology, ecology: { name: @ecology.name }
    assert_redirected_to ecology_path(assigns(:ecology))
  end

  test "should destroy ecology" do
    assert_difference('Ecology.count', -1) do
      delete :destroy, id: @ecology
    end

    assert_redirected_to ecologies_path
  end
end
