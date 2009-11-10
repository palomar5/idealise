require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should "give list of hottest users" do
    assert User.most_respected
  end
end
