# frozen_string_literal: true

FactoryBot.define do
  factory(:address) do
    city { Faker::Address.city }
    latitude { Faker::Address.latitude }
    longitude { Faker::Address.longitude }
    secondary_address { nil }
    state { Faker::Address.state_abbr }
    street_address { Faker::Address.street_address }
    zip_code { Faker::Address.zip_code }
  end
end
