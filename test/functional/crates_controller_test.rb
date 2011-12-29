require 'test_helper'

class CratersControllerTest < ActionController::TestCase
  setup do
    @crater = craters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:craters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crater" do
    assert_difference('Crater.count') do
      post :create, :crater => @crater.attributes
    end

    assert_redirected_to crater_path(assigns(:crater))
  end

  test "should show crater" do
    get :show, :id => @crater.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @crater.to_param
    assert_response :success
  end

  test "should update crater" do
    put :update, :id => @crater.to_param, :crater => @crater.attributes
    assert_redirected_to crater_path(assigns(:crater))
  end

  test "should destroy crater" do
    assert_difference('Crater.count', -1) do
      delete :destroy, :id => @crater.to_param
    end

    assert_redirected_to craters_path
  end
end
