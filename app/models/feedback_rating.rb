class FeedbackRating < ActiveRecord::Base
  
  belongs_to :feedback
  belongs_to :user
  
  after_save :adjust_rating_points_for_user
  
  validates_uniqueness_of :feedback_id, :scope => [:user_id]

private
  def adjust_rating_points_for_user
    user = self.feedback.user
    if user
      user.update_attribute(:rating_points, (user.rating_points || 0) + self.rating)
    end
    true
  end
  
end
