class Project < ActiveRecord::Base
  acts_as_taggable_on :tags
  has_many :feedbacks
  
  validates_presence_of :description, :short_description, :title
  
end
