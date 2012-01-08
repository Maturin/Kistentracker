require 'test_helper'

class CratePrioritiesControllerTest < ActionController::TestCase
  setup do
    @crate_priority = crate_priorities(:one)
    @update = {
      :priority => 5,
      :description => 'Normal'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:crate_priorities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create crate_priority" do
    assert_difference('CratePriority.count') do
      post :create, :crate_priority => @update
    end

    assert_redirected_to crate_priority_path(assigns(:crate_priority))
  end

  test "should show crate_priority" do
    get :show, :id => @crate_priority.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @crate_priority.to_param
    assert_response :success
  end

  test "should update crate_priority" do
    put :update, :id => @crate_priority.to_param, :crate_priority => @crate_priority.attributes
    assert_redirected_to crate_priority_path(assigns(:crate_priority))
  end

  test "should destroy crate_priority" do
    assert_difference('CratePriority.count', -1) do
      delete :destroy, :id => @crate_priority.to_param
    end

    assert_redirected_to crate_priorities_path
  end
end
