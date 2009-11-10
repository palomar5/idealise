class ProjectsController < ResourceController::Base
  
  before_filter :login_required, :except => [:show, :index]
  
  create.after do
    object.user = current_user
    object.save
  end
  
  show.before do
    object.add_visit(current_user)
    true
  end
  
end
