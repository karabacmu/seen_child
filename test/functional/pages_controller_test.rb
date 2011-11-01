require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get report_a_child" do
    get :report_a_child
    assert_response :success
  end

  test "should get contact" do
    get :contact
    assert_response :success
  end

end
