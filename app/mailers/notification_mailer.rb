class NotificationMailer < ApplicationMailer
  # set up a default from when email sent
  default from: "no-rely@nomsterapp.com"
  # add template
  def comment_added(comment)
    @place = comment.place
    @place_owner = @place.user
    mail(to: "powaileung6@gmail.com", 
         subject: "A comment has been added to #{@place.name}")
  end
end
