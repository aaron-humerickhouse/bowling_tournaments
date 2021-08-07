class Tournament < ApplicationRecord
  belongs_to :alley
  belongs_to :host
  accepts_nested_attributes_for :host,
                                allow_destroy: false,
                                reject_if: lambda { |attributes|
                                  attributes['name'].blank? && (
                                    attributes['phone'].blank? ||
                                    attributes['email'].blank?
                                  )
                                }
  FORMAT_OPTIONS = %i[SINGLES DOUBLES TEAM DUTCH BAKER OTHER].freeze
  PARTICIPANTS_OPTIONS = %i[MENS WOMENS MIXED YOUTH].freeze


end
