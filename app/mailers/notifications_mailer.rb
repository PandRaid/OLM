class NotificationsMailer < ActionMailer::Base
  default :from => "ilovebouldering@gmail.com"
  default :to => "olmadm1nistratorz@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "#{message.subject}")
  end
end
