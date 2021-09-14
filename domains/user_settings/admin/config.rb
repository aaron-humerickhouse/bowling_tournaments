RailsAdmin.config do |config|
  # Skipping new in config/initializers/rails_admin
  config.model 'UserSetting' do
    field :user do
      required true
      read_only true
      pretty_value do
        v = bindings[:view]
        user_setting = bindings[:object]
        user = user_setting.user
        value = user.full_name
        v.link_to(value, "/admin/user/#{user.id}")
      end
    end
    field :zip_code do
      required true
    end
    field :notification_search_radius, :enum do
      enum do
        UserSetting::NOTIFICATION_SEARCH_RADIUS
      end
    end
    field :notification_period, :enum do
      enum do
        UserSetting::NOTIFICATION_PERIODS
      end

      multiple do
        true
      end
    end
  end
end
