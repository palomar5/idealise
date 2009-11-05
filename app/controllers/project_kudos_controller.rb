class ProjectKudosController < ResourceController::Base
  
  belongs_to :project
  
  def create
    if [1,-1].include?(params[:rating].to_i)
      kudos = parent_object.project_kudos.find_or_initialize_by_user_id(current_user.id)
      kudos.rating = params[:rating].to_i
      kudos.save
    end
    redirect_to smart_url(parent_url_options)
  end
  
  
private
  def resource_name
    "project_kudos"
  end
  
  def object_name
    "project_kudos"
  end
end
