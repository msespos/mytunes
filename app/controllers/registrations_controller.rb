# frozen_string_literal: true

# Registrations controller class
class RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(_resource)
    edit_user_path(current_user.id)
  end
end
