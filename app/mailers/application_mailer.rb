# frozen_string_literal: true

# ApplicationMailer Class
class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

  def welcome_email(user)
    @user = user
    @url  = 'https://protected-river-06788.herokuapp.com/'
    mail(to: @user.email, subject: 'Welcome to myTunes')
  end
end
