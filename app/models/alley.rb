# frozen_string_literal: true

require 'states'

class Alley < ApplicationRecord
  belongs_to :address
  accepts_nested_attributes_for :address,
                                allow_destroy: true,
                                reject_if: lambda { |attributes|
                                  attributes['street_address'].blank? ||
                                    attributes['city'].blank? ||
                                    attributes['state'].blank? ||
                                    attributes['zip_code'].blank?
                                }

  def readable
    "#{name} - #{address.city}, #{::STATES[address.state.to_sym]}"
  end
end
