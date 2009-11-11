class Project < ActiveRecord::Base
  acts_as_taggable_on :tags

  has_many :feedbacks
  has_many :project_ratings
  belongs_to :user
  has_many :visits
  
  validates_presence_of :description, :title

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
  
  def add_visit(user = nil)
    #self.update_attribute(:visits_count, (self.visits_count || 0) + 1)
    self.visits.create(:user => user)
  end
  
end
