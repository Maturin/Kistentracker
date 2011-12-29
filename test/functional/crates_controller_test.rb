require 'test_helper'

class CratesControllerTest < ActionController::TestCase
  setup do
    @crate = crates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crate" do
    assert_difference('Crate.count') do
      post :create, :crate => @crate.attributes
    end

    assert_redirected_to crate_path(assigns(:crate))
  end

  test "should show crate" do
    get :show, :id => @crate.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @crate.to_param
    assert_response :success
  end

  test "should update crate" do
    put :update, :id => @crate.to_param, :crate => @crate.attributes
    assert_redirected_to crate_path(assigns(:crate))
  end

  test "should destroy crate" do
    assert_difference('Crate.count', -1) do
      delete :destroy, :id => @crate.to_param
    end

    assert_redirected_to crates_path
  end
end
