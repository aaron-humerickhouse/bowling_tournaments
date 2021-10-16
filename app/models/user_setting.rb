# frozen_string_literal: true

class UserSetting < ApplicationRecord
  belongs_to :user

  before_save :compact_periods

  validates :zip_code, presence: true
  validates :notification_period, presence: true
  validates :notification_search_radius, presence: true

  NOTIFICATION_PERIODS = [0, 1, 2, 3, 7, 14, 30, 60, 90].freeze
  NOTIFICATION_SEARCH_RADIUS = [0, 5, 15, 25, 50, 100, 250, 500].freeze

  scope :notifiable, -> { where.not('notification_period @> ?', '{0}') }

  private

  def compact_periods
    notification_period.compact!

    notification_period.delete(0) if notification_period.any?(&:positive?)
  end
end
