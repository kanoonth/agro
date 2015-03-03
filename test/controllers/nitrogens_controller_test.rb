require 'test_helper'

class NitrogensControllerTest < ActionController::TestCase
  setup do
    @nitrogen = nitrogens(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:nitrogens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create nitrogen" do
    assert_difference('Nitrogen.count') do
      post :create, nitrogen: { cf: @nitrogen.cf, disease_id: @nitrogen.disease_id, max: @nitrogen.max, min: @nitrogen.min, stage_id: @nitrogen.stage_id }
    end

    assert_redirected_to nitrogen_path(assigns(:nitrogen))
  end

  test "should show nitrogen" do
    get :show, id: @nitrogen
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @nitrogen
    assert_response :success
  end

  test "should update nitrogen" do
    patch :update, id: @nitrogen, nitrogen: { cf: @nitrogen.cf, disease_id: @nitrogen.disease_id, max: @nitrogen.max, min: @nitrogen.min, stage_id: @nitrogen.stage_id }
    assert_redirected_to nitrogen_path(assigns(:nitrogen))
  end

  test "should destroy nitrogen" do
    assert_difference('Nitrogen.count', -1) do
      delete :destroy, id: @nitrogen
    end

    assert_redirected_to nitrogens_path
  end
end
