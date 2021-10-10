# frozen_string_literal: true

FactoryBot.define do
  factory(:tournament) do
    alley
    difficulty { ::Tournament::DIFFICULTY_OPTIONS.sample }
    flyer_url { Faker::Internet.url }
    events { [Tournament::EVENT_OPTIONS.sample] }
    name { Faker::Music.album }
    participants { [::Tournament::PARTICIPANTS_OPTIONS.sample] }
    starts_at { 3.days.from_now }
    contact_name { Faker::Name.name }
    contact_email { Faker::Internet.safe_email }
    contact_phone { Faker::PhoneNumber.phone_number }

    # after(:build) { |tournament| tournament.class.skip_callback(:create, :after, :notify_new_tournament) }
  end
end
