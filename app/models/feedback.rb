class Feedback < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  has_many :feedback_ratings
  
  validates_presence_of :text
  
  def kudos_history
    running = 0
    feedback_ratings.all(:limit => 20).map{|kudos| running = running + kudos.rating }
  end
  
  
end
