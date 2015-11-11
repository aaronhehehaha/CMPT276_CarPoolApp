require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post new" do
    post :new
    assert_response :success
  end
end
