require 'test_helper'

class BoardsControllerTest < ActionController::TestCase
  test "should get create_mentor" do
    get :create_mentor
    assert_response :success
  end

  test "should get delete_mentor" do
    get :delete_mentor
    assert_response :success
  end

  test "should get create_mentee" do
    get :create_mentee
    assert_response :success
  end

  test "should get delete_mentee" do
    get :delete_mentee
    assert_response :success
  end

  test "should get management" do
    get :management
    assert_response :success
  end

end
