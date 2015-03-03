require 'test_helper'

class RainsControllerTest < ActionController::TestCase
  setup do
    @rain = rains(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rains)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create rain" do
    assert_difference('Rain.count') do
      post :create, rain: { cf: @rain.cf, disease_id: @rain.disease_id, max: @rain.max, min: @rain.min }
    end

    assert_redirected_to rain_path(assigns(:rain))
  end

  test "should show rain" do
    get :show, id: @rain
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @rain
    assert_response :success
  end

  test "should update rain" do
    patch :update, id: @rain, rain: { cf: @rain.cf, disease_id: @rain.disease_id, max: @rain.max, min: @rain.min }
    assert_redirected_to rain_path(assigns(:rain))
  end

  test "should destroy rain" do
    assert_difference('Rain.count', -1) do
      delete :destroy, id: @rain
    end

    assert_redirected_to rains_path
  end
end
