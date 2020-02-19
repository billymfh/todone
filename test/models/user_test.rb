require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = users(:valid_user)
  end

  test "is invalid without an email address" do
    @user.email = nil
    refute @user.valid?, 'user is valid without an email address'
    assert_not_nil @user.errors[:email], 'no validation error for missing email address'
  end

  test "should not be able to create a user with a duplicate email address" do
    duplicate_user = User.new(email: @user.email, password: "password")
    assert_not duplicate_user.save, 'able to create user with a duplicate email address'
  end

  test "should not be able to create a user if password confirmation does not match" do
    user = User.new(email: "test_confirmation@example.com", password: "password", password_confirmation: "passwrod")
    refute user.save, 'able to create user with a mismatched password confirmation'
  end
end
