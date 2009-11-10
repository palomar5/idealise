require 'test_helper'

class FeedbackRatingTest < ActiveSupport::TestCase
  should_belong_to :user
  should_belong_to :feedback
  
  context "after_save" do
    should "adjust rating points of user after saving the rating" do
      rating_before = users(:simple_user).rating_points || 0
      feedbacks(:one).feedback_ratings.create(:user => users(:second), :rating => 1)
      assert_equal(rating_before + 1, users(:simple_user).reload.rating_points)
    end
  end
end
