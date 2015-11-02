require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get browse" do
    get :browse
    assert_response :success
  end

  test "should get search" do
    get :search
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

end
