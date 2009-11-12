class Project < ActiveRecord::Base
  acts_as_taggable_on :tags

  has_attached_file :image, 
    :styles => { :medium => "228x234#", :thumb => "105x108#"},
    :storage => (Rails.env == 'production') ? :s3 : :filesystem,
    :s3_credentials => {:access_key_id => ENV['S3_ACCESS_KEY_ID'], :secret_access_key => ENV['S3_SECRET_ACCESS_KEY']},
    :bucket => 'idealise-production-images',
    :path => (Rails.env == 'production') ? ":attachment/:id/:style.:extension" : ":rails_root/public:url"

  has_many :feedbacks
  has_many :project_ratings
  belongs_to :user
  has_many :visits
  
  validates_presence_of :description, :title

  after_create :send_notifications

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
  
  def feedback_tags
    self.feedbacks.root.map(&:tag_list).flatten.uniq
  end

private
  
  def send_notifications
    unless self.tag_list.empty?
      users_to_notify = User.find_tagged_with(self.tag_list) + self.user.connected_users
      users_to_notify.reject! {|u| u == self.user }
      users_to_notify.uniq.each do |receiver|
        UserMailer.deliver_project_notification(receiver, self) unless receiver.email.blank?
      end
      true
    end
  end
  
end
