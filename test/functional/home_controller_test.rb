require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should render the home page" do
    get :index
    assert_response :success
    assert_template 'index'
  end
  test "should render the dashboard" do
    get :dashboard
    assert_response :success
    assert_template 'dashboard'
  end
end
