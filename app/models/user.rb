class User < ActiveRecord::Base
  
  def self.most_respected(options = {})
    FeedbackRating.all(
      :joins => "JOIN feedbacks ON feedbacks.id == feedback_ratings.feedback_id JOIN users ON feedbacks.user_id = users.id",
      :group => "users.id", 
      :select => "*,sum(feedback_ratings.rating) AS sum",
      :order => 'sum DESC',
      :limit => options[:limit] || 10
    ).map{|fr| [fr.feedback.user, fr.sum] }
  end
  
end
