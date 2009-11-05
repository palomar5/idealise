require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  context "show" do
    should "render show" do
      get :show, :id => users(:simple_user).to_param
      assert_response :success
      assert_template "show"
    end
  end
  
  context "index" do
    should "render index" do
      get :index
      assert_response :success
      assert_template "index"
    end
    
  end
end
