require 'test_helper'

class FeedbacksControllerTest < ActionController::TestCase
  
  context "create" do
    setup do
      login_user(:simple_user)
    end
    
    should "create a project" do
      assert_difference "Feedback.count" do
        post :create, :project_id => projects(:simple_project).to_param, :feedback => { :text => "Test" }
      end
      assert_redirected_to project_url(projects(:simple_project))
    end
    
    should "render the show view of projects if an error occurs" do
      post :create, :project_id => projects(:simple_project).to_param, :feedback => { :text => "" }
      assert_template('projects/show')
    end
  end
  
  test "should redirect if not logged in" do
    post :create, :project_id => projects(:simple_project).to_param, :feedback => { :text => "foo" }
    assert_redirected_to new_session_url
  end
  
end
