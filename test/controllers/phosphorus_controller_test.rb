require 'test_helper'

class PhosphorusControllerTest < ActionController::TestCase
  setup do
    @phosphoru = phosphorus(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:phosphorus)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create phosphoru" do
    assert_difference('Phosphoru.count') do
      post :create, phosphoru: { cf: @phosphoru.cf, disease_id: @phosphoru.disease_id, max: @phosphoru.max, min: @phosphoru.min, stage_id: @phosphoru.stage_id }
    end

    assert_redirected_to phosphoru_path(assigns(:phosphoru))
  end

  test "should show phosphoru" do
    get :show, id: @phosphoru
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @phosphoru
    assert_response :success
  end

  test "should update phosphoru" do
    patch :update, id: @phosphoru, phosphoru: { cf: @phosphoru.cf, disease_id: @phosphoru.disease_id, max: @phosphoru.max, min: @phosphoru.min, stage_id: @phosphoru.stage_id }
    assert_redirected_to phosphoru_path(assigns(:phosphoru))
  end

  test "should destroy phosphoru" do
    assert_difference('Phosphoru.count', -1) do
      delete :destroy, id: @phosphoru
    end

    assert_redirected_to phosphorus_path
  end
end
