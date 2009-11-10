class FeedbackRequest < ActiveRecord::Base
  belongs_to :user
  belongs_to :project
  belongs_to :receiver, :class_name => "User", :foreign_key => 'receiver_id'
  
  before_validation :try_to_find_user_for_given_email
  
  after_create :send_by_email
  
  def try_to_find_user_for_given_email
    if self.receiver.nil?
      self.receiver = User.find_by_email(self.receiver_email)
      unless self.receiver.blank?
        self.receiver_email = nil
      end
    end
    true
  end
  
  def send_by_email
    if self.receiver_email
      UserMailer.deliver_foreign_feedback_request(self.receiver_email, self.project, self.text)
    else
      UserMailer.deliver_registered_feedback_request(self.receiver, self.project, self.text)
    end
  end
  true
end
