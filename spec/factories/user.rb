FactoryBot.define do
  factory(:user) do
    confirmation_sent_at { 1.day.ago }
    confirmation_token { SecureRandom.hex(10) }
    confirmed_at { 12.hours.ago }
    email { Faker::Internet.safe_email }
    password { 'Test1234' }
    password_confirmation { 'Test1234' }
    failed_attempts { 0 }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    locked_at { nil }
    remember_created_at { nil }
    reset_password_sent_at { nil }
    reset_password_token { nil }
    unconfirmed_email { nil }
    unlock_token { nil }

    after(:create) do |user|
      create(:user_setting, user: user)
    end
  end
end
