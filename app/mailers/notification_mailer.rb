class NotificationMailer < ApplicationMailer
  # set up a default from when email sent
  default from: "no-reply@nomsterapp.com"
  # add template
  def comment_added(comment)
    @place = comment.place
    @place_owner = @place.user
    mail(to: @place_owner.email, 
         subject: "A comment has been added to #{@place.name}")
  end
end
