require 'test_helper'

class JournalsControllerTest < ActionController::TestCase
  setup do
    @journal = journals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:journals)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create journal" do
    assert_difference('Journal.count') do
      post :create, journal: { amount: @journal.amount, credit_id: @journal.credit_id, credit_type: @journal.credit_type, debit_id: @journal.debit_id, debit_type: @journal.debit_type, memo: @journal.memo, trade_date: @journal.trade_date, uid: @journal.uid }
    end

    assert_redirected_to journal_path(assigns(:journal))
  end

  test "should show journal" do
    get :show, id: @journal
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @journal
    assert_response :success
  end

  test "should update journal" do
    patch :update, id: @journal, journal: { amount: @journal.amount, credit_id: @journal.credit_id, credit_type: @journal.credit_type, debit_id: @journal.debit_id, debit_type: @journal.debit_type, memo: @journal.memo, trade_date: @journal.trade_date, uid: @journal.uid }
    assert_redirected_to journal_path(assigns(:journal))
  end

  test "should destroy journal" do
    assert_difference('Journal.count', -1) do
      delete :destroy, id: @journal
    end

    assert_redirected_to journals_path
  end
end
