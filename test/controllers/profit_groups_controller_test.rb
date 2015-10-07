require 'test_helper'

class ProfitGroupsControllerTest < ActionController::TestCase
  setup do
    @profit_group = profit_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:profit_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create profit_group" do
    assert_difference('ProfitGroup.count') do
      post :create, profit_group: { name: @profit_group.name, user_id: @profit_group.user_id }
    end

    assert_redirected_to profit_group_path(assigns(:profit_group))
  end

  test "should show profit_group" do
    get :show, id: @profit_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @profit_group
    assert_response :success
  end

  test "should update profit_group" do
    patch :update, id: @profit_group, profit_group: { name: @profit_group.name, user_id: @profit_group.user_id }
    assert_redirected_to profit_group_path(assigns(:profit_group))
  end

  test "should destroy profit_group" do
    assert_difference('ProfitGroup.count', -1) do
      delete :destroy, id: @profit_group
    end

    assert_redirected_to profit_groups_path
  end
end
