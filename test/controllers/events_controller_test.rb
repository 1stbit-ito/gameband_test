require 'test_helper'

class EventsControllerTest < ActionController::TestCase
  setup do
    @event = events(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:events)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create event" do
    assert_difference('Event.count') do
      post :create, event: { created_at: @event.created_at, delete_flag: @event.delete_flag, description: @event.description, event_id: @event.event_id, event_type: @event.event_type, finish_date: @event.finish_date, game_id: @event.game_id, name: @event.name, revival_event_id: @event.revival_event_id, start_date: @event.start_date, tag_name: @event.tag_name, updated_at: @event.updated_at }
    end

    assert_redirected_to event_path(assigns(:event))
  end

  test "should show event" do
    get :show, id: @event
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @event
    assert_response :success
  end

  test "should update event" do
    patch :update, id: @event, event: { created_at: @event.created_at, delete_flag: @event.delete_flag, description: @event.description, event_id: @event.event_id, event_type: @event.event_type, finish_date: @event.finish_date, game_id: @event.game_id, name: @event.name, revival_event_id: @event.revival_event_id, start_date: @event.start_date, tag_name: @event.tag_name, updated_at: @event.updated_at }
    assert_redirected_to event_path(assigns(:event))
  end

  test "should destroy event" do
    assert_difference('Event.count', -1) do
      delete :destroy, id: @event
    end

    assert_redirected_to events_path
  end
end
