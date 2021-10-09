# frozen_string_literal: true

FactoryBot.define do
  factory(:alley) do
    address
    name { Faker::ChuckNorris.fact }
    phone_number { Faker::PhoneNumber.phone_number }
  end
end
