require 'test_helper'

class YamajisControllerTest < ActionController::TestCase
  setup do
    @yamaji = yamajis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yamajis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yamaji" do
    assert_difference('Yamaji.count') do
      post :create, yamaji: { mail: @yamaji.mail, name: @yamaji.name, updated_at: @yamaji.updated_at }
    end

    assert_redirected_to yamaji_path(assigns(:yamaji))
  end

  test "should show yamaji" do
    get :show, id: @yamaji
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yamaji
    assert_response :success
  end

  test "should update yamaji" do
    patch :update, id: @yamaji, yamaji: { mail: @yamaji.mail, name: @yamaji.name, updated_at: @yamaji.updated_at }
    assert_redirected_to yamaji_path(assigns(:yamaji))
  end

  test "should destroy yamaji" do
    assert_difference('Yamaji.count', -1) do
      delete :destroy, id: @yamaji
    end

    assert_redirected_to yamajis_path
  end
end
