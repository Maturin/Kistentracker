require 'test_helper'

class CraterpayersControllerTest < ActionController::TestCase
  setup do
    @craterpayer = craterpayers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:craterpayers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create craterpayer" do
    assert_difference('Craterpayer.count') do
      post :create, :craterpayer => @craterpayer.attributes
    end

    assert_redirected_to craterpayer_path(assigns(:craterpayer))
  end

  test "should show craterpayer" do
    get :show, :id => @craterpayer.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @craterpayer.to_param
    assert_response :success
  end

  test "should update craterpayer" do
    put :update, :id => @craterpayer.to_param, :craterpayer => @craterpayer.attributes
    assert_redirected_to craterpayer_path(assigns(:craterpayer))
  end

  test "should destroy craterpayer" do
    assert_difference('Craterpayer.count', -1) do
      delete :destroy, :id => @craterpayer.to_param
    end

    assert_redirected_to craterpayers_path
  end
end
