require 'test_helper'

class UserTest < ActiveSupport::TestCase
  should "give list of hottest users" do
    assert User.most_respected
  end
  
  should "be taggable" do
    @user = User.new
    assert @user.respond_to?(:tag_list)
    assert @user.respond_to?(:tag_list=)
  end
  
end
