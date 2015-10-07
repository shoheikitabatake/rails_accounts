require 'test_helper'

class DebtGroupsControllerTest < ActionController::TestCase
  setup do
    @debt_group = debt_groups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:debt_groups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create debt_group" do
    assert_difference('DebtGroup.count') do
      post :create, debt_group: { name: @debt_group.name, user_id: @debt_group.user_id }
    end

    assert_redirected_to debt_group_path(assigns(:debt_group))
  end

  test "should show debt_group" do
    get :show, id: @debt_group
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @debt_group
    assert_response :success
  end

  test "should update debt_group" do
    patch :update, id: @debt_group, debt_group: { name: @debt_group.name, user_id: @debt_group.user_id }
    assert_redirected_to debt_group_path(assigns(:debt_group))
  end

  test "should destroy debt_group" do
    assert_difference('DebtGroup.count', -1) do
      delete :destroy, id: @debt_group
    end

    assert_redirected_to debt_groups_path
  end
end
