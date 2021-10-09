# frozen_string_literal: true

json.array! @user_settings, partial: 'user_settings/user_setting', as: :user_setting
