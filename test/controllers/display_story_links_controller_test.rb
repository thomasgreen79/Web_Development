require 'test_helper'

class DisplayStoryLinksControllerTest < ActionController::TestCase
  test "should get byName" do
    get :byName
    assert_response :success
  end

  test "should get byAuthor" do
    get :byAuthor
    assert_response :success
  end

  test "should get byLocation" do
    get :byLocation
    assert_response :success
  end

  test "should get byTravelCategory" do
    get :byTravelCategory
    assert_response :success
  end

  test "should get byStoryType" do
    get :byStoryType
    assert_response :success
  end

end
