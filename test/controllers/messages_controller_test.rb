require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:example)
  end

  test "index should require login" do
    get messages_url
    assert_redirected_to login_url
  end

  test "index" do
    login_as @user
    get messages_url
    assert_response :success
  end

  test "should handle invalid message" do
    login_as @user
    post messages_url, params: { message: { content: "" } }, xhr: true
    assert_response :success
  end

  test "should create valid message" do
    login_as @user
    post messages_url, params: { message: { content: "Lorem" } }, xhr: true
    assert_response :success
  end
end
