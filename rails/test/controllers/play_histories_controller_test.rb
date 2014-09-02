require 'test_helper'

class PlayHistoriesControllerTest < ActionController::TestCase
  setup do
    @play_history = play_histories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:play_histories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create play_history" do
    assert_difference('PlayHistory.count') do
      post :create, play_history: { audio_id: @play_history.audio_id, data: @play_history.data, user_id: @play_history.user_id }
    end

    assert_redirected_to play_history_path(assigns(:play_history))
  end

  test "should show play_history" do
    get :show, id: @play_history
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @play_history
    assert_response :success
  end

  test "should update play_history" do
    patch :update, id: @play_history, play_history: { audio_id: @play_history.audio_id, data: @play_history.data, user_id: @play_history.user_id }
    assert_redirected_to play_history_path(assigns(:play_history))
  end

  test "should destroy play_history" do
    assert_difference('PlayHistory.count', -1) do
      delete :destroy, id: @play_history
    end

    assert_redirected_to play_histories_path
  end
end
