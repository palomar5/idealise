class User < ActiveRecord::Base

  acts_as_taggable_on :tags
  
  named_scope :most_respected, :order => "rating_points DESC"
  has_many :projects
  
end
