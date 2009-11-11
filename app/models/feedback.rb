class Feedback < ActiveRecord::Base
  
  acts_as_tree
  acts_as_taggable_on :tags
  
  belongs_to :project
  belongs_to :user
  
  has_many :feedback_ratings
  
  named_scope :root, :conditions => { :parent_id => nil }
  
  validates_presence_of :text
  
  def kudos_history
    running = 0
    feedback_ratings.all(:limit => 20).map{|kudos| running = running + kudos.rating }
  end
  
end
