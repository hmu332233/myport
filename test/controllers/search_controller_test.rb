require 'test_helper'

class SearchControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get search_users" do
    get :search_users
    assert_response :success
  end

  test "should get search_posts" do
    get :search_posts
    assert_response :success
  end

end
