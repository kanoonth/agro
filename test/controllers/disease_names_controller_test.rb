require 'test_helper'

class DiseaseNamesControllerTest < ActionController::TestCase
  setup do
    @disease_name = disease_names(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:disease_names)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create disease_name" do
    assert_difference('DiseaseName.count') do
      post :create, disease_name: { disease_id: @disease_name.disease_id, name: @disease_name.name }
    end

    assert_redirected_to disease_name_path(assigns(:disease_name))
  end

  test "should show disease_name" do
    get :show, id: @disease_name
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @disease_name
    assert_response :success
  end

  test "should update disease_name" do
    patch :update, id: @disease_name, disease_name: { disease_id: @disease_name.disease_id, name: @disease_name.name }
    assert_redirected_to disease_name_path(assigns(:disease_name))
  end

  test "should destroy disease_name" do
    assert_difference('DiseaseName.count', -1) do
      delete :destroy, id: @disease_name
    end

    assert_redirected_to disease_names_path
  end
end
