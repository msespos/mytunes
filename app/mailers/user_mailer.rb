# frozen_string_literal: true

class UserMailer < ApplicationMailer
  default from: ENV['GMAIL_USER_ID']
end
