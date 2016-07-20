require 'test_helper'

class UserTest < ActiveSupport::TestCase


  def setup
    @user = User.new(username: "example_user", password: "password",
                     password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?, @user.errors.full_messages
  end

  test "username should be present" do
    @user.username = ""
    assert_not @user.valid?
  end

  test "username should be unique" do
    duplicate_user = @user.dup
    duplicate_user.username = @user.username.upcase
    @user.save
    assert_not duplicate_user.valid?
  end

  test "username should have a maximum length" do
    @user.username = "a" * 16
    assert_not @user.valid?
  end

  test "username should have the right format" do
    %w[foo bar foobar foo_bar FooBar8].each do |username|
      @user.username = username
      assert @user.valid?, @user.username
    end
    %w[foo-bar foobar$ *bar].each do |username|
      @user.username = username
      assert_not @user.valid?, @user.username
    end
  end

  test "password should be present" do
    @user.password = @user.password_confirmation = " " * 6
    assert_not @user.valid?
  end

  test "password should have a minimum length" do
    @user.password = @user.password_confirmation = "a" * 5
    assert_not @user.valid?
  end
end
