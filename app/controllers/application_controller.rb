# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(resource)
    tournaments_path
  end

  def after_sign_out_path_for(resource)
    tournaments_path
  end

  def after_confirmation_path_for(resource_name, resource)
    edit_settings_path(resource)
  end
end
