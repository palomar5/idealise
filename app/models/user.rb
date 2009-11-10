class User < ActiveRecord::Base
  
  named_scope :most_respected, :order => "rating_points DESC"
  has_many :projects
  
  
  
end
