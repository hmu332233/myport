require 'test_helper'

class PageControllerTest < ActionController::TestCase
  test "should get my" do
    get :my
    assert_response :success
  end

end
