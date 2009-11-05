class Project < ActiveRecord::Base
  acts_as_taggable_on :tags
  has_many :feedbacks
  has_many :project_kudos, :class_name => "ProjectKudos"
  belongs_to :user
  
  validates_presence_of :description, :short_description, :title
  
end
