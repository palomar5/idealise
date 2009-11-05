class Project < ActiveRecord::Base
  acts_as_taggable_on :tags

  has_many :feedbacks
  has_many :project_kudos, :class_name => "ProjectKudos"
  belongs_to :user
  
  validates_presence_of :description, :short_description, :title

  def kudos_history
    running = 0
    project_kudos.all(:limit => 20).map{|kudos| running = running + kudos.rating }
  end

  def self.hot(options = {})
    options = {:group => "project_id", :select => "*, count(1) AS count", :order => "count DESC"}.merge(options)
    ProjectKudos.all(options).map(&:project)
  end
  
end
