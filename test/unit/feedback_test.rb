require 'test_helper'

class FeedbackTest < ActiveSupport::TestCase
  should_validate_presence_of :text

  should_belong_to :project
  should_belong_to :user
end
