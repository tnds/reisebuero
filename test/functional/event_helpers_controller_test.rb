require 'test_helper'

class EventHelpersControllerTest < ActionController::TestCase
  setup do
    @event_helper = event_helpers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_helpers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_helper" do
    assert_difference('EventHelper.count') do
      post :create, event_helper: {  }
    end

    assert_redirected_to event_helper_path(assigns(:event_helper))
  end

  test "should show event_helper" do
    get :show, id: @event_helper
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_helper
    assert_response :success
  end

  test "should update event_helper" do
    put :update, id: @event_helper, event_helper: {  }
    assert_redirected_to event_helper_path(assigns(:event_helper))
  end

  test "should destroy event_helper" do
    assert_difference('EventHelper.count', -1) do
      delete :destroy, id: @event_helper
    end

    assert_redirected_to event_helpers_path
  end
end
