class ProjectsController < ResourceController::Base
  
  before_filter :login_required, :except => [:show, :index]
  
  create.after do
    object.user = current_user
    object.save
  end
  
end
