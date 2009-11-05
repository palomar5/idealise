require 'test_helper'

class ProjectTest < ActiveSupport::TestCase
  should_validate_presence_of :title, :short_description, :description
  should_belong_to :user
  should_have_many :feedbacks
  should_have_many :project_kudos
  
  context "tagging" do
    should "act as taggable on tags" do
      assert Project.new.respond_to?(:tag_list)
      assert Project.new.respond_to?(:tag_list=)
      assert Project.new.respond_to?(:tags)
    end
  end
  
end
