class FeedbackRequestsController < ApplicationController
  before_filter :login_required
  
  def create
    project = Project.find(params[:project_id])
    if params[:user_id] && user = User.find_by_id(params[:user_id])
      FeedbackRequest.create(params[:feedback_request].merge(:project => project, :user => current_user, :receiver => user))
    else
      receivers = params[:receivers].split(/,|\r\n|\n|\r/).map(&:strip)
      receivers.each do |receiver|
        FeedbackRequest.create(params[:feedback_request].merge(:project => project, :user => current_user, :receiver_email => receiver))
      end
    end
    flash[:notice] =  "We just send out messages to the people. Let's hope that they will answer yer call..."
    redirect_to project
  end
  
end
