class FeedbacksController < ResourceController::Base

  before_filter :login_required
  
  belongs_to :project

  def create
    @feedback = parent_object.feedbacks.build(params[:feedback])
    @feedback.user = current_user
    if @feedback.save
      flash[:notice] = "Thanks for the feedback, mate"
      redirect_to smart_url(parent_url_options)
    else
      @project = parent_object
      render 'projects/show'
    end
    
  end

  create.wants.html { redirect_to smart_url(parent_url_options) }
  
end
