require 'test_helper'

class EntriesControllerTest < ActionController::TestCase
  setup do
    @entry = entries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entry" do
    assert_difference('Entry.count') do
      post :create, entry: { content: @entry.content, created_at: @entry.created_at, delete_flag: @entry.delete_flag, entry_id: @entry.entry_id, entry_time: @entry.entry_time, entry_type: @entry.entry_type, entry_user_id: @entry.entry_user_id, favorite_num: @entry.favorite_num, game_id: @entry.game_id, image_path01: @entry.image_path01, image_path02: @entry.image_path02, image_path03: @entry.image_path03, image_path04: @entry.image_path04, parent_id: @entry.parent_id, relation_tag: @entry.relation_tag, reply_to: @entry.reply_to, retweet_num: @entry.retweet_num, tags: @entry.tags, updated_at: @entry.updated_at, warning_num: @entry.warning_num }
    end

    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should show entry" do
    get :show, id: @entry
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entry
    assert_response :success
  end

  test "should update entry" do
    patch :update, id: @entry, entry: { content: @entry.content, created_at: @entry.created_at, delete_flag: @entry.delete_flag, entry_id: @entry.entry_id, entry_time: @entry.entry_time, entry_type: @entry.entry_type, entry_user_id: @entry.entry_user_id, favorite_num: @entry.favorite_num, game_id: @entry.game_id, image_path01: @entry.image_path01, image_path02: @entry.image_path02, image_path03: @entry.image_path03, image_path04: @entry.image_path04, parent_id: @entry.parent_id, relation_tag: @entry.relation_tag, reply_to: @entry.reply_to, retweet_num: @entry.retweet_num, tags: @entry.tags, updated_at: @entry.updated_at, warning_num: @entry.warning_num }
    assert_redirected_to entry_path(assigns(:entry))
  end

  test "should destroy entry" do
    assert_difference('Entry.count', -1) do
      delete :destroy, id: @entry
    end

    assert_redirected_to entries_path
  end
end
