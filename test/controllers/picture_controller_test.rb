require 'test_helper'

class PictureControllerTest < ActionController::TestCase
  test "should get picture" do
    get :picture
    assert_response :success
  end

  test "should get game" do
    get :game
    assert_response :success
  end

end
