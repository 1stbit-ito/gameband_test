require 'test_helper'

class GameProfilesControllerTest < ActionController::TestCase
  setup do
    @game_profile = game_profiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:game_profiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game_profile" do
    assert_difference('GameProfile.count') do
      post :create, game_profile: { comment: @game_profile.comment, created_at: @game_profile.created_at, delete_flag: @game_profile.delete_flag, game_id: @game_profile.game_id, image_path01: @game_profile.image_path01, image_path02: @game_profile.image_path02, image_path03: @game_profile.image_path03, image_path04: @game_profile.image_path04, updated_at: @game_profile.updated_at, user_id: @game_profile.user_id, value01: @game_profile.value01, value02: @game_profile.value02, value03: @game_profile.value03, value04: @game_profile.value04, value05: @game_profile.value05, value06: @game_profile.value06, value07: @game_profile.value07, value08: @game_profile.value08, value09: @game_profile.value09, value10: @game_profile.value10 }
    end

    assert_redirected_to game_profile_path(assigns(:game_profile))
  end

  test "should show game_profile" do
    get :show, id: @game_profile
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game_profile
    assert_response :success
  end

  test "should update game_profile" do
    patch :update, id: @game_profile, game_profile: { comment: @game_profile.comment, created_at: @game_profile.created_at, delete_flag: @game_profile.delete_flag, game_id: @game_profile.game_id, image_path01: @game_profile.image_path01, image_path02: @game_profile.image_path02, image_path03: @game_profile.image_path03, image_path04: @game_profile.image_path04, updated_at: @game_profile.updated_at, user_id: @game_profile.user_id, value01: @game_profile.value01, value02: @game_profile.value02, value03: @game_profile.value03, value04: @game_profile.value04, value05: @game_profile.value05, value06: @game_profile.value06, value07: @game_profile.value07, value08: @game_profile.value08, value09: @game_profile.value09, value10: @game_profile.value10 }
    assert_redirected_to game_profile_path(assigns(:game_profile))
  end

  test "should destroy game_profile" do
    assert_difference('GameProfile.count', -1) do
      delete :destroy, id: @game_profile
    end

    assert_redirected_to game_profiles_path
  end
end
