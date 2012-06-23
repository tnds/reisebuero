require 'test_helper'

class EventOrgasControllerTest < ActionController::TestCase
  setup do
    @event_orga = event_orgas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:event_orgas)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event_orga" do
    assert_difference('EventOrga.count') do
      post :create, event_orga: {  }
    end

    assert_redirected_to event_orga_path(assigns(:event_orga))
  end

  test "should show event_orga" do
    get :show, id: @event_orga
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event_orga
    assert_response :success
  end

  test "should update event_orga" do
    put :update, id: @event_orga, event_orga: {  }
    assert_redirected_to event_orga_path(assigns(:event_orga))
  end

  test "should destroy event_orga" do
    assert_difference('EventOrga.count', -1) do
      delete :destroy, id: @event_orga
    end

    assert_redirected_to event_orgas_path
  end
end
