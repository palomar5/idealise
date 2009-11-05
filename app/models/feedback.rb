class Feedback < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  has_many :feedback_ratings
  
  validates_presence_of :text
  
end
