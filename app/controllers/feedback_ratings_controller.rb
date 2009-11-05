class FeedbackRatingsController < ResourceController::Base
  
  before_filter :login_required
  
  belongs_to :feedback
  
  def create
    if [1,-1].include?(params[:rating].to_i)
      rating = parent_object.feedback_ratings.find_or_initialize_by_user_id(current_user.id)
      rating.rating = params[:rating].to_i
      rating.save
    end
    redirect_to project_url(parent_object.project)
  end
  
  
end
