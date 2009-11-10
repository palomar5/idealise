require 'test_helper'

class ProjectRatingTest < ActiveSupport::TestCase
  should_belong_to :project
  should_belong_to :user
  
  # should_validate_uniqueness_of :project_id TODO: Not currently working, check out how to test this
  
end
