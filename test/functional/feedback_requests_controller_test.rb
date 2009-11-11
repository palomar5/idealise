require 'test_helper'

class FeedbackRequestsControllerTest < ActionController::TestCase
  context "from user page" do
    setup do
      login_user(:simple_user)
    end
    should "create feedback request" do
      assert_difference "FeedbackRequest.count" do
        post :create, :project_id => projects(:simple_project).id, :user_id => users(:second).id, :feedback_request => { :text  => 'Hi' }
        
      end
    end
  end
  context "from project page" do
    setup do
      login_user(:simple_user)
    end
    should "create feedback request" do
      assert_difference "FeedbackRequest.count" do
        post :create, :project_id => projects(:simple_project).id, :receivers => users(:second).email, :feedback_request => { :text  => 'Hi' }
      end
    end
  end
end
