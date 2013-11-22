class NotificationsMailer < ActionMailer::Base
  default :from => "noreply@polar-wildwood-2829.herokuapp.com"
  default :to => "admin@polar-wildwood-2829.herokuapp.com"

  def new_message(message)
    @message = message
    mail(:subject => "[YourWebsite.tld] #{message.subject}")
  end
end
