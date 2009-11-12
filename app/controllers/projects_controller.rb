class ProjectsController < ResourceController::Base
  
  before_filter :login_required, :except => [:show, :index]
  
  create.before do
    object.user = current_user
    object.save
  end
  
  show.before do
    unless params[:tag].blank?
      @first_level_feedbacks = object.feedbacks.root.find_tagged_with(params[:tag])
    else
      @first_level_feedbacks = object.feedbacks.root
    end
    object.add_visit(current_user)
    true
  end
  
end
