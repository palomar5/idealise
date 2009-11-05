class FeedbackRating < ActiveRecord::Base
  
  belongs_to :feedback
  belongs_to :user
  
  validates_uniqueness_of :feedback_id, :scope => [:user_id]
end
