class HomeController < ApplicationController
  
  def index
    @hot_projects = Project.hot(:limit => 10)
    @respected_users = [] #User.most_respected(:limit => 10)
  end
  
end
