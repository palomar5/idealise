require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  context "feedback_requests to foreign users" do
    setup do
      @mail = UserMailer.create_foreign_feedback_request("foo@example.com", projects(:simple_project), "getiton")
    end
    should "contain text" do
      assert_match /getiton/, @mail.body
    end
    should "set correct to address" do
      assert_equal "foo@example.com", @mail.to[0]
    end
    should "contain link to project" do
      assert_match /projects\/#{projects(:simple_project).id}/, @mail.body
    end
    
  end

  context "feedback_requests to registered users" do
    setup do
      @mail = UserMailer.create_registered_feedback_request(users(:second), projects(:simple_project), "getonwithit")
    end
    should "contain text" do
      assert_match /getonwithit/, @mail.body
    end
    should "set correct to address" do
      assert_equal users(:second).email, @mail.to[0]
    end
    should "contain link to project" do
      assert_match /projects\/#{projects(:simple_project).id}/, @mail.body
    end    
  end
  
  context "project notification" do
    setup do
      @mail = UserMailer.create_project_notification(users(:second), projects(:simple_project))
    end

    should "set correct to address" do
      assert_equal users(:second).email, @mail.to[0]
    end
    
    should "contain link to project" do
      assert_match /projects\/#{projects(:simple_project).id}/, @mail.body
    end
    
  end
  
end
