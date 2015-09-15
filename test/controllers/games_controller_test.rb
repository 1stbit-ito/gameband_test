require 'test_helper'

class GamesControllerTest < ActionController::TestCase
  setup do
    @game = games(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:games)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create game" do
    assert_difference('Game.count') do
      post :create, game: { created_at: @game.created_at, description: @game.description, game_id: @game.game_id, header_image_path: @game.header_image_path, icon_image_path: @game.icon_image_path, login_finish_time: @game.login_finish_time, login_start_time: @game.login_start_time, name: @game.name, play_start_date: @game.play_start_date, profile_key_name01: @game.profile_key_name01, profile_key_name02: @game.profile_key_name02, profile_key_name03: @game.profile_key_name03, profile_key_name04: @game.profile_key_name04, profile_key_name05: @game.profile_key_name05, profile_key_name06: @game.profile_key_name06, profile_key_name07: @game.profile_key_name07, profile_key_name08: @game.profile_key_name08, profile_key_name09: @game.profile_key_name09, profile_key_name10: @game.profile_key_name10, tag_name: @game.tag_name, updated_at: @game.updated_at, web_view_url: @game.web_view_url }
    end

    assert_redirected_to game_path(assigns(:game))
  end

  test "should show game" do
    get :show, id: @game
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @game
    assert_response :success
  end

  test "should update game" do
    patch :update, id: @game, game: { created_at: @game.created_at, description: @game.description, game_id: @game.game_id, header_image_path: @game.header_image_path, icon_image_path: @game.icon_image_path, login_finish_time: @game.login_finish_time, login_start_time: @game.login_start_time, name: @game.name, play_start_date: @game.play_start_date, profile_key_name01: @game.profile_key_name01, profile_key_name02: @game.profile_key_name02, profile_key_name03: @game.profile_key_name03, profile_key_name04: @game.profile_key_name04, profile_key_name05: @game.profile_key_name05, profile_key_name06: @game.profile_key_name06, profile_key_name07: @game.profile_key_name07, profile_key_name08: @game.profile_key_name08, profile_key_name09: @game.profile_key_name09, profile_key_name10: @game.profile_key_name10, tag_name: @game.tag_name, updated_at: @game.updated_at, web_view_url: @game.web_view_url }
    assert_redirected_to game_path(assigns(:game))
  end

  test "should destroy game" do
    assert_difference('Game.count', -1) do
      delete :destroy, id: @game
    end

    assert_redirected_to games_path
  end
end
