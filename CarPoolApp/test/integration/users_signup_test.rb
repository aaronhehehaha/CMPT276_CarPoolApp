require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  def setup
    ActionMailer::Base.deliveries.clear
  end
  test "invalid signup information" do
    get root_path
    assert_no_difference 'User.count' do
      post users_path, user: { firstname: "",
        lastname: "",
        email: "user@invalid",
        password: "foo",
        password_confirmation: "bar" }
      end
      assert_template 'users/new'
    end
    test "valid signup information with account activation" do
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, user: { firstname:  "Example",
                                lastname: "User",
                               email: "user@example.com",
                               password:              "password",
                               password_confirmation: "password" }
    end
  end
  end
