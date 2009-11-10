require 'test_helper'

class VisitTest < ActiveSupport::TestCase
  should_belong_to :user
  should_belong_to :project
end
