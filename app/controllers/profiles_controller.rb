class ProfilesController < ApplicationController
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = "Your profile has been updated"
      redirect_to @user
    else
      render :edit
    end
  end
  
end
