class UsersController < ResourceController::Base
  
  index.before do
    unless params[:tag].blank?
      @users = User.find_tagged_with(params[:tag])
    end
  end
  
end
