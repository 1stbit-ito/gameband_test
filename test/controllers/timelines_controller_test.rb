require 'test_helper'

class TimelinesControllerTest < ActionController::TestCase
  setup do
    @timeline = timelines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:timelines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create timeline" do
    assert_difference('Timeline.count') do
      post :create, timeline: { created_at: @timeline.created_at, delete_flag: @timeline.delete_flag, entry_id: @timeline.entry_id, entry_time: @timeline.entry_time, entry_user_id: @timeline.entry_user_id, favorite_flag: @timeline.favorite_flag, game_id: @timeline.game_id, reply_to: @timeline.reply_to, retweet_flag: @timeline.retweet_flag, tags: @timeline.tags, text: @timeline.text, updated_at: @timeline.updated_at, user_id: @timeline.user_id, warning_flag: @timeline.warning_flag }
    end

    assert_redirected_to timeline_path(assigns(:timeline))
  end

  test "should show timeline" do
    get :show, id: @timeline
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @timeline
    assert_response :success
  end

  test "should update timeline" do
    patch :update, id: @timeline, timeline: { created_at: @timeline.created_at, delete_flag: @timeline.delete_flag, entry_id: @timeline.entry_id, entry_time: @timeline.entry_time, entry_user_id: @timeline.entry_user_id, favorite_flag: @timeline.favorite_flag, game_id: @timeline.game_id, reply_to: @timeline.reply_to, retweet_flag: @timeline.retweet_flag, tags: @timeline.tags, text: @timeline.text, updated_at: @timeline.updated_at, user_id: @timeline.user_id, warning_flag: @timeline.warning_flag }
    assert_redirected_to timeline_path(assigns(:timeline))
  end

  test "should destroy timeline" do
    assert_difference('Timeline.count', -1) do
      delete :destroy, id: @timeline
    end

    assert_redirected_to timelines_path
  end
end
