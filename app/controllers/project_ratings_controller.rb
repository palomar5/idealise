class ProjectRatingsController < ResourceController::Base
  include ApplicationHelper
  
  before_filter :login_required
  
  belongs_to :project
  
  def create
    if [1,-1].include?(params[:rating].to_i)
      kudos = parent_object.project_ratings.find_or_initialize_by_user_id(current_user.id)
      kudos.rating = params[:rating].to_i
      kudos.save
    end
    respond_to do |format|
      format.html { redirect_to smart_url(parent_url_options) }
      format.json { render :json => { :toReplace => { "project_#{parent_object.id}_kudos" => "<dt>Kudos:</dt><dd>#{parent_object.reload.project_ratings.sum(:rating)} " + kudos_sparkline_tag(parent_object.reload.kudos_history, "ffffff", "262626", "90x18") + "</dd>" } }.to_json }
    end
  end
end
