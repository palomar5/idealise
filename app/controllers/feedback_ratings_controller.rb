class FeedbackRatingsController < ResourceController::Base
  
  include ApplicationHelper
  
  before_filter :login_required
  
  belongs_to :feedback
  
  def create
    if [1,-1].include?(params[:rating].to_i)
      rating = parent_object.feedback_ratings.find_or_initialize_by_user_id(current_user.id)
      rating.rating = params[:rating].to_i
      rating.save
    end
    respond_to do |format|
      format.html { redirect_to project_url(parent_object.project) }
      format.json { 
        render :json => { 
          :toReplace => { "feedback_#{parent_object.id}_kudos" => kudos_sparkline_tag(parent_object.reload.kudos_history, "8c8c8c", "ffffff") } 
        }.to_json
      }
    end
  end
  
  
end
