# frozen_string_literal: true

class Tournament < ApplicationRecord
  # enum difficulty: { HOUSE: 'HOUSE', CHALLENGE: 'CHALLENGE', SPORT: 'SPORT' }
  # enum participants: { MENS: 'MENS', WOMENS: 'WOMENS', MIXED: 'MIXED', YOUTH: 'YOUTH' }
  # enum events: {
  #   SINGLES: 'SINGLES', DOUBLES: 'DOUBLES', TEAM: 'TEAM',
  #   DUTCH: 'DUTCH', BAKER: 'BAKER', OTHER: 'OTHER'
  # }
  has_one_attached :flyer

  belongs_to :alley

  validate :correct_document_mime_type

  # after_create :notify_new_tournament

  EVENT_OPTIONS = %i[SINGLES DOUBLES TEAM DUTCH BAKER OTHER].freeze
  PARTICIPANTS_OPTIONS = %i[MENS WOMENS MIXED YOUTH].freeze
  DIFFICULTY_OPTIONS = %i[HOUSE CHALLENGE SPORT].freeze

  def events_enum
    EVENT_OPTIONS
  end

  def participants_enum
    PARTICIPANTS_OPTIONS
  end

  def difficulty_enum
    DIFFICULTY_OPTIONS
  end

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

  def correct_document_mime_type
    if document.attached? && !document.content_type.in?(%w(image/png image/jpeg application/pdf))
      document.purge # delete the uploaded file
      errors.add(:document, 'Must be a PDF or a DOC file')
    end
  end
end
