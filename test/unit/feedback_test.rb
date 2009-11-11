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
  
  context "acts as taggable on tags" do
    should "have taggable methods" do
      @feedback = Feedback.new
      assert @feedback.respond_to?(:tag_list=)
      assert @feedback.respond_to?(:tag_list)
    end
    
    should "find feedbacks by tags" do
      feedback = feedbacks(:one)
      feedback.tag_list = "foo, bar"
      feedback.save
      
      assert Feedback.find_tagged_with("foo").include?(feedback)
    end
    
  end
  
end
