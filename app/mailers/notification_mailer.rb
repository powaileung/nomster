class NotificationMailer < ApplicationMailer
  # set up a default from when email sent
  default from: "no-reply@nomsterapp.com"
  # add template
  def comment_added
    mail(to: "powaileung6@gmail.com", 
         subject: "A comment has been added to your place")
  end
end
