require 'test_helper'

class LossGroupsControllerTest < ActionController::TestCase
  setup do
    @loss_group = loss_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loss_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loss_group" do
    assert_difference('LossGroup.count') do
      post :create, loss_group: { name: @loss_group.name, user_id: @loss_group.user_id }
    end

    assert_redirected_to loss_group_path(assigns(:loss_group))
  end

  test "should show loss_group" do
    get :show, id: @loss_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loss_group
    assert_response :success
  end

  test "should update loss_group" do
    patch :update, id: @loss_group, loss_group: { name: @loss_group.name, user_id: @loss_group.user_id }
    assert_redirected_to loss_group_path(assigns(:loss_group))
  end

  test "should destroy loss_group" do
    assert_difference('LossGroup.count', -1) do
      delete :destroy, id: @loss_group
    end

    assert_redirected_to loss_groups_path
  end
end
