require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  should_validate_presence_of :title, :description
  should_belong_to :user
  should_have_many :feedbacks
  should_have_many :project_ratings
  
  context "tagging" do
    should "act as taggable on tags" do
      assert Project.new.respond_to?(:tag_list)
      assert Project.new.respond_to?(:tag_list=)
      assert Project.new.respond_to?(:tags)
    end
  end
  
  context "hot" do
    should "give hot projects" do
      projects = Project.hot
      assert_not_nil projects
    end
  end
  
  context "visits count" do
    should "add visits to the project" do
      assert_difference "projects(:simple_project).reload.visits.size || 0" do
        projects(:simple_project).add_visit
      end
    end
  end

  context "notification of experts" do
    should "deliver notification" do
      users(:second).update_attribute( :tag_list, "crazytag" )
      assert_difference "ActionMailer::Base.deliveries.count" do
        project = Project.new(:user => users(:simple_user), :description => "we can haz", :title => "wooo", :tag_list => "crazytag")
        project.save
      end
    end
    
    should "not deliver notification if no tags given" do
      assert_no_difference "ActionMailer::Base.deliveries.count" do
        project = Project.new(:user => users(:simple_user), :description => "we can haz", :title => "wooo")
        project.save
      end
    end
    
    should "deliver notification if user gave feedback on projects of this user before" do
      assert_difference "ActionMailer::Base.deliveries.count" do
        puts projects(:simple_project).feedbacks.create(:user => users(:second), :text => "foo").inspect
        project = Project.new(:user => users(:simple_user), :description => "we can haz", :title => "wooo")
        project.save
        puts users(:simple_user).reload.connected_users.inspect
        
      end
    end
    
  end
  
  
  
end
