require 'test_helper'

class AssetGroupsControllerTest < ActionController::TestCase
  setup do
    @asset_group = asset_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:asset_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset_group" do
    assert_difference('AssetGroup.count') do
      post :create, asset_group: { name: @asset_group.name, user_id: @asset_group.user_id }
    end

    assert_redirected_to asset_group_path(assigns(:asset_group))
  end

  test "should show asset_group" do
    get :show, id: @asset_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset_group
    assert_response :success
  end

  test "should update asset_group" do
    patch :update, id: @asset_group, asset_group: { name: @asset_group.name, user_id: @asset_group.user_id }
    assert_redirected_to asset_group_path(assigns(:asset_group))
  end

  test "should destroy asset_group" do
    assert_difference('AssetGroup.count', -1) do
      delete :destroy, id: @asset_group
    end

    assert_redirected_to asset_groups_path
  end
end
