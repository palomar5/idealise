class User < ActiveRecord::Base
  
  def self.most_respected(options = {})
    users = User.all(
      :joins => "JOIN feedbacks ON feedbacks.user_id = users.id JOIN feedback_ratings ON feedback_ratings.feedback_id = feedbacks.id",
      :select => "users.*, feedback_ratings.rating"
    )
  end
  
end
