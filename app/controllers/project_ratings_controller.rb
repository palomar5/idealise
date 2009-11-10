class ProjectRatingsController < ResourceController::Base
  
  before_filter :login_required
  
  belongs_to :project
  
  def create
    if [1,-1].include?(params[:rating].to_i)
      kudos = parent_object.project_ratings.find_or_initialize_by_user_id(current_user.id)
      kudos.rating = params[:rating].to_i
      kudos.save
    end
    redirect_to smart_url(parent_url_options)
  end
end
