require 'test_helper'

class PropertyGroupsControllerTest < ActionController::TestCase
  setup do
    @property_group = property_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:property_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create property_group" do
    assert_difference('PropertyGroup.count') do
      post :create, property_group: { name: @property_group.name, user_id: @property_group.user_id }
    end

    assert_redirected_to property_group_path(assigns(:property_group))
  end

  test "should show property_group" do
    get :show, id: @property_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @property_group
    assert_response :success
  end

  test "should update property_group" do
    patch :update, id: @property_group, property_group: { name: @property_group.name, user_id: @property_group.user_id }
    assert_redirected_to property_group_path(assigns(:property_group))
  end

  test "should destroy property_group" do
    assert_difference('PropertyGroup.count', -1) do
      delete :destroy, id: @property_group
    end

    assert_redirected_to property_groups_path
  end
end
