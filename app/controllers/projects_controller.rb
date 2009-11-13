class ProjectsController < ResourceController::Base
  
  before_filter :login_required, :except => [:show, :index]
  
  create.after do
    object.user = current_user
    object.save
  end
  
  show.before do
    unless params[:tag].blank?
      @first_level_feedbacks = object.feedbacks.root.find_tagged_with(params[:tag])
    else
      @first_level_feedbacks = object.feedbacks.root
    end
    @matching_users = @project.tag_list.collect { |tag| User.find_tagged_with(tag) }.flatten.uniq
    object.add_visit(current_user)
    true
  end
  
  index.before do
    unless params[:tag].blank?
      @projects = Project.find_tagged_with(params[:tag])
    end
  end
  
end
