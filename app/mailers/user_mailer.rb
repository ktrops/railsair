class UserMailer < ApplicationMailer
  default from: "info@railsair.com"

  def welcome_email(user)
    @user = user
    mail(to: user.email, subject: "Welcome to railsair!")
  end
end