class User < ActiveRecord::Base

  acts_as_taggable_on :tags
  
  named_scope :most_respected, :order => "rating_points DESC"
  has_many :projects
  has_many :feedbacks
  has_many :projects_with_feedback, :through => :feedbacks, :source => :project, :uniq => true
  has_many :project_feedbacks, :through => :projects, :source => :feedbacks, :uniq => true
  
  def connected_users
    project_feedbacks.map(&:user).uniq
  end
  
end
