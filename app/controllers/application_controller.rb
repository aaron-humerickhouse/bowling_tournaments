# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [
                                        :first_name,
                                        :last_name,
                                        {
                                          user_setting_attributes: [
                                            :zip_code,
                                            :notification_search_radius,
                                            { notification_period: [] }
                                          ]
                                        }
                                      ])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[first_name last_name])
  end

  def after_sign_in_path_for(_resource)
    tournaments_path
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def after_confirmation_path_for(_resource_name, resource)
    edit_settings_path(resource)
  end
end
