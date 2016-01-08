require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "can create user" do
    user = User.new(email: "test@user.com",
                    password: "password",
                    username: "test")

    assert user.save
    assert user.errors.empty?
  end

  test "cannot create user without email" do
    user = User.new(username: "test", password: "password")

    refute user.save
    assert user.errors.present?
  end

  test "cannot create user without username" do
    user = User.new(email: "test@user.com", password: "password")

    refute user.save
    assert user.errors.present?
  end

  test "cannot create user without password" do
    user = User.new(email: "test@user.com", username: "test")

    refute user.save
    assert user.errors.present?
  end

  test "cannot create user with duplicate email" do
    user = User.new(email: "one@email.com", username: "test", password: "password")

    refute user.save
    assert user.errors.present?
  end

  test "cannot create user with duplicate username" do
    user = User.new(email: "test@email.com", username: "one", password: "password")

    refute user.save
    assert user.errors.present?
  end

  test "cannot create user with bad email format" do
    user = User.new(email: "test.com", username: "one", password: "password")

    refute user.save
    assert user.errors.present?
  end
end
