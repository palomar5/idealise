require 'test_helper'

class FeedbackRequestTest < ActiveSupport::TestCase
  should_belong_to :user
  should_belong_to :receiver
  should_belong_to :project

  should "should set receiver to existing user if found by email" do
    request = FeedbackRequest.new(:project => projects(:simple_project), :user => users(:simple_user), :text => 'foo', :receiver_email => users(:second).email)
    request.valid?
    assert_not_nil request.receiver
    assert_nil request.receiver_email
  end
  
  should "send email on creation" do
    assert_difference "ActionMailer::Base.deliveries.size" do
      request = FeedbackRequest.create(:project => projects(:simple_project), :user => users(:simple_user), :text => 'foo', :receiver_email => users(:second).email)
    end
  end

  should "send email on creation" do
    assert_difference "ActionMailer::Base.deliveries.size" do
      request = FeedbackRequest.create(:project => projects(:simple_project), :user => users(:simple_user), :text => 'foo', :receiver_email => "crazy@example.com")
    end
  end
  
end
