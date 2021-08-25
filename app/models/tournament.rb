class Tournament < ApplicationRecord
  belongs_to :alley

  after_create :notify_new_tournament

  EVENT_OPTIONS = %i[SINGLES DOUBLES TEAM DUTCH BAKER OTHER].freeze
  PARTICIPANTS_OPTIONS = %i[MENS WOMENS MIXED YOUTH].freeze
  DIFFICULTY = %i[HOUSE CHALLENGE SPORT].freeze

  private

  def notify_new_tournament

  end
end
