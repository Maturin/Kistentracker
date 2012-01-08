require 'test_helper'

class CrateTypesControllerTest < ActionController::TestCase
  setup do
    @crate_type = crate_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crate_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crate_type" do
    assert_difference('CrateType.count') do
      post :create, :crate_type => @crate_type.attributes
    end

    assert_redirected_to crate_type_path(assigns(:crate_type))
  end

  test "should show crate_type" do
    get :show, :id => @crate_type.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @crate_type.to_param
    assert_response :success
  end

  test "should update crate_type" do
    put :update, :id => @crate_type.to_param, :crate_type => @crate_type.attributes
    assert_redirected_to crate_type_path(assigns(:crate_type))
  end

  test "should destroy crate_type" do
    assert_difference('CrateType.count', -1) do
      delete :destroy, :id => @crate_type.to_param
    end

    assert_redirected_to crate_types_path
  end
end
