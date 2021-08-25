FactoryBot.define do
  factory(:tournament) do
    alley
    difficulty { ::Tournament::DIFFICULTY.sample }
    flyer_url { Faker::Internet.url }
    events { [Tournament::EVENT_OPTIONS.sample] }
    name { Faker::Music.album }
    participants { [::Tournament::PARTICIPANTS_OPTIONS.sample] }
    starts_at { 3.days.from_now }
    contact_name { Faker::Name.name }
    contact_email { Faker::Internet.safe_email }
    contact_phone { Faker::PhoneNumber.phone_number }
  end
end
