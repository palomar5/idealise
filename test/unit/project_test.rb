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
  
  
  
end
