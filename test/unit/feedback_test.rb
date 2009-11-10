require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  should_validate_presence_of :text

  should_belong_to :project
  should_belong_to :user
  
  context "acts as tree" do
    context "named scope root" do
      should "not include threaded feedbacks" do
        assert !Feedback.root.include?(feedbacks(:threaded))
      end
      should "include root feeback" do
        assert Feedback.root.include?(feedbacks(:one))
      end
    end
  end
  
  
end
