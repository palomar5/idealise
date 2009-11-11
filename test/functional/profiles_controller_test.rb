require 'test_helper'

class ProfilesControllerTest < ActionController::TestCase
  context "edit view" do
    setup do
      login_user :simple_user
    end
    should "render form" do
      get :edit
      assert_template "edit"
    end
    
    should "assign templates" do
      get :edit
      assert_not_nil assigns(:user)
    end
  end
  
  context "update action" do
    setup do
      login_user :simple_user
    end
    
    should "redirect to user page on success" do
      put :update, :user => {:tag_list => 'foo, bar'}
      assert_redirected_to user_path(users(:simple_user))
    end
    
  end 
  
end
