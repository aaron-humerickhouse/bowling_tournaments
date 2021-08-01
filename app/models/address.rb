class Address < ApplicationRecord
  has_one :alley
  has_many :tournaments

  geocoded_by :address
  after_validation :geocode

  def geolocation
    [latitude, longitude]
  end

  private

  def address
    [street_address, city, state, zip_code].compact.join(', ')
  end
end
