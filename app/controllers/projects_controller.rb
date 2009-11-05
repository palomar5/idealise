class ProjectsController < ResourceController::Base
  create.after do
    object.user = current_user
    object.save
  end
  
end
