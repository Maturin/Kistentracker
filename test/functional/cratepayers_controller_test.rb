require 'test_helper'

class CratepayersControllerTest < ActionController::TestCase
  setup do
    @cratepayer = cratepayers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cratepayers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cratepayer" do
    assert_difference('Cratepayer.count') do
      post :create, :cratepayer => @cratepayer.attributes
    end

    assert_redirected_to cratepayer_path(assigns(:cratepayer))
  end

  test "should show cratepayer" do
    get :show, :id => @cratepayer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cratepayer.to_param
    assert_response :success
  end

  test "should update cratepayer" do
    put :update, :id => @cratepayer.to_param, :cratepayer => @cratepayer.attributes
    assert_redirected_to cratepayer_path(assigns(:cratepayer))
  end

  test "should destroy cratepayer" do
    assert_difference('Cratepayer.count', -1) do
      delete :destroy, :id => @cratepayer.to_param
    end

    assert_redirected_to cratepayers_path
  end
end
