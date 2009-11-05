# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  extend ActiveSupport::Memoizable
  
  
  helper_method :current_user, :logged_in?
  
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  def current_user
    User.find_by_id(session[:user_id])
  end
  
  def current_user=(user)
    session[:user_id] = user.id
  end
  
  def logged_in?
    self.current_user
  end
  
  def login_required
    return true if logged_in?
    flash[:notice] = "You need to be logged in to do this."
    redirect_to new_session_path and return false
  end


  # memoize :current_user
  
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
