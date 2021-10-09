# frozen_string_literal: true

class UserSetting < ApplicationRecord
  # enum notification_period: {'0': 0, '1': 1, '2': 2, '3': 3, '7': 7, '14': 14, '30': 30, '60': 60, '90': 90}, _suffix: true
  # enum notification_search_radius: {'0': 0, '5': 5, '15': 15, '25': 25, '50': 50, '100': 100, '250': 250, '1000': 1000}

  belongs_to :user

  before_save :compact_periods

  NOTIFICATION_PERIODS = [0, 1, 2, 3, 7, 14, 30, 60, 90].freeze
  NOTIFICATION_SEARCH_RADIUS = [0, 5, 15, 25, 50, 100, 250, 500].freeze

  scope :notifiable, -> { where.not('notification_period @> ?', '{0}') }

  private

  def compact_periods
    notification_period.compact!

    notification_period.delete(0) if notification_period.any?(&:positive?)
  end
end
