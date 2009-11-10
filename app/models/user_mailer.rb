class UserMailer < ActionMailer::Base
  def foreign_feedback_request(receiver, project, text)
    recipients receiver
    from "idealisep5@googlemail.com"
    subject "[tafkai] #{project.user.name} would like you to give feedback on his project"
    body :project => project, :receiver => receiver, :text => text
  end
  
  def registered_feedback_request(receiver, project, text)
    recipients receiver.email
    from "idealisep5@googlemail.com"
    subject "[tafkai] #{project.user.name} would like you to give feedback on his project"
    body :project => project, :receiver => receiver, :text => text    
  end

end
