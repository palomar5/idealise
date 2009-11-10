class Project < ActiveRecord::Base
  acts_as_taggable_on :tags

  has_many :feedbacks
  has_many :project_ratings
  belongs_to :user
  
  validates_presence_of :description, :short_description, :title

  def kudos_history
    running = 0
    project_ratings.all(:limit => 20).map{|kudos| running = running + kudos.rating }
  end

  def self.hot(options = {})
    options = {
      :group => "project_id, project_ratings.id, project_ratings.rating, project_ratings.user_id, project_ratings.created_at, project_ratings.updated_at", 
      :select => "project_ratings.*, count(1) AS count", 
      :order => "count DESC"
    }.merge(options)
    ProjectRating.all(options).map(&:project)
  end
  
end
