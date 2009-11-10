namespace :ratings do
  desc "fix rating points on users" 
  task :fix_all => :environment do
    FeedbackRating.all.each do |fr|
      feedback_user = fr.feedback.user
      if feedback_user
        feedback_user.update_attribute(:rating_points, (feedback_user.rating_points || 0) + fr.rating)
      end
    end
  end
end