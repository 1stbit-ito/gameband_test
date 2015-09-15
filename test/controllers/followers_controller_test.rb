require 'test_helper'

class FollowersControllerTest < ActionController::TestCase
  setup do
    @follower = followers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:followers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create follower" do
    assert_difference('Follower.count') do
      post :create, follower: { created_at: @follower.created_at, delete_flag: @follower.delete_flag, follower_user_id: @follower.follower_user_id, game_id: @follower.game_id, updated_at: @follower.updated_at, user_id: @follower.user_id }
    end

    assert_redirected_to follower_path(assigns(:follower))
  end

  test "should show follower" do
    get :show, id: @follower
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @follower
    assert_response :success
  end

  test "should update follower" do
    patch :update, id: @follower, follower: { created_at: @follower.created_at, delete_flag: @follower.delete_flag, follower_user_id: @follower.follower_user_id, game_id: @follower.game_id, updated_at: @follower.updated_at, user_id: @follower.user_id }
    assert_redirected_to follower_path(assigns(:follower))
  end

  test "should destroy follower" do
    assert_difference('Follower.count', -1) do
      delete :destroy, id: @follower
    end

    assert_redirected_to followers_path
  end
end
