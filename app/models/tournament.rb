class Tournament < ApplicationRecord
  enum difficulty: { HOUSE: 'HOUSE', CHALLENGE: 'CHALLENGE', SPORT: 'SPORT' }
  enum participants: { MENS: 'MENS', WOMENS: 'WOMENS', MIXED: 'MIXED', YOUTH: 'YOUTH' }
  enum events: {
    SINGLES: 'SINGLES', DOUBLES: 'DOUBLES', TEAM: 'TEAM',
    DUTCH: 'DUTCH', BAKER: 'BAKER', OTHER: 'OTHER'
  }

  belongs_to :alley

  after_create :notify_new_tournament

  EVENT_OPTIONS = %i[SINGLES DOUBLES TEAM DUTCH BAKER OTHER].freeze
  PARTICIPANTS_OPTIONS = %i[MENS WOMENS MIXED YOUTH].freeze
  DIFFICULTY = %i[HOUSE CHALLENGE SPORT].freeze

  private

  def notify_new_tournament
    Notifications::Service.new.tournament_notify(id: id)
  end

  def array_to_hash(arr)
    hash = {}
    arr.each do
      hash[arr.to_sym] = arr
    end
    hash
  end
end
