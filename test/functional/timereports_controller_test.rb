require 'test_helper'

class TimereportsControllerTest < ActionController::TestCase
  setup do
    @timereport = timereports(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timereports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timereport" do
    assert_difference('Timereport.count') do
      post :create, timereport: { end_date: @timereport.end_date, start_date: @timereport.start_date, user: @timereport.user }
    end

    assert_redirected_to timereport_path(assigns(:timereport))
  end

  test "should show timereport" do
    get :show, id: @timereport
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timereport
    assert_response :success
  end

  test "should update timereport" do
    put :update, id: @timereport, timereport: { end_date: @timereport.end_date, start_date: @timereport.start_date, user: @timereport.user }
    assert_redirected_to timereport_path(assigns(:timereport))
  end

  test "should destroy timereport" do
    assert_difference('Timereport.count', -1) do
      delete :destroy, id: @timereport
    end

    assert_redirected_to timereports_path
  end
end
