class FeedbacksController < ResourceController::Base
  
  belongs_to :project

  create.wants.html { redirect_to smart_url(parent_url_options) }
  
end
