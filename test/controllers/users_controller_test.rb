require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "should get new" do
    get new_user_url
    assert_response :success
  end

  test "should reject invalid submission" do
    assert_no_difference 'User.count' do
      post users_url,
           params: { user: { username: "", password: "",
                             password_confirmation: "" } }
    end
    assert_response :success
    assert_select 'div#error_explanation'
    assert_template 'users/new'
  end

  test "should accept valid submission" do
    assert_difference 'User.count', 1 do
      post users_url,
           params: { user: { username: "test", password: "password",
                             password_confirmation: "password" } }
    end
    assert is_logged_in?
    assert_redirected_to messages_url
  end
end
