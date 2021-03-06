# frozen_string_literal: true

class Address < ApplicationRecord
  has_one :alley
  has_many :tournaments

  validates :zip_code, presence: true, format: { with: /A[0-9]{5}z/ }
  validates :street_address, presence: true
  validates :state, presence: true
  validates :city, presence: true

  # geocoded_by :friendly_address
  after_validation :geocode

  def geolocation
    [latitude, longitude]
  end

  def friendly_address
    [street_address, city, state, zip_code].compact.join(', ')
  end

  def friendly_city
    [city, state, zip_code].compact.join(', ')
  end

  private

  def geocode
    results = Geocoder.search(friendly_address)
    results = Geocoder.search(friendly_city) if results.empty?
    results = Geocoder.search(zip_code) if results.empty?

    return unless results&.first&.coordinates&.any?

    coordinates = results.first.coordinates
    self.latitude = coordinates.first
    self.longitude = coordinates.last
  end
end
