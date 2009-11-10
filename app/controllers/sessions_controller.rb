class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, :only => [:rpx_token]
  
  def new
  end
  
  def rpx_token
    RPXNow.api_key = ENV['RPX_NOW_API_KEY']
    raise "hackers?" unless data = RPXNow.user_data(params[:token])
    self.current_user = User.find_by_identifier(data[:identifier]) || User.create!(data)
    redirect_to '/'
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end
  
end
