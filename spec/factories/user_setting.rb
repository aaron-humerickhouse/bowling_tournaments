FactoryBot.define do
  factory(:user_setting) do
    notification_period { [2, 7] }
    notification_search_radius { 50 }
    user
    zip_code { Faker::Address.zip_code }
  end
end
