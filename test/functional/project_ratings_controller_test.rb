require 'test_helper'

class ProjectRatingsControllerTest < ActionController::TestCase

  context "create" do
    setup do
      login_user(:simple_user)
    end
    
    should "create a project rating" do
      assert_difference "ProjectRating.count" do
        post :create, :project_id => projects(:simple_project).to_param, :rating => 1
      end
      assert_redirected_to project_url(projects(:simple_project))
    end    
  end
  
  test "should redirect if not logged in" do
    post :create, :project_id => projects(:simple_project).to_param, :rating => 1
    assert_redirected_to new_session_url
  end

end
