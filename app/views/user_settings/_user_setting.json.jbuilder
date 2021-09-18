json.extract! user_setting, :id, :user_id, :notification_search_radius, :created_at, :updated_at
json.url settings_path(user_setting, format: :json)
