class FeedbacksController < ResourceController::Base

  before_filter :login_required
  
  belongs_to :project

  def create
    if params[:parent_id] && parent = parent_object.feedbacks.find(params[:parent_id])
      @feedback = parent.children.build(params[:feedback].merge({:project => parent_object }))
    else
      @feedback = parent_object.feedbacks.build(params[:feedback])
    end
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
