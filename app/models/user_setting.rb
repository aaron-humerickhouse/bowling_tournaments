# frozen_string_literal: true

class UserSetting < ApplicationRecord
  belongs_to :user

  NOTIFICATION_PERIODS = [0, 1, 2, 3, 7, 14, 30, 60, 90].freeze
  NOTIFICATION_SEARCH_RADIUS = [0, 5, 15, 25, 50, 100, 250, 1000].freeze

  scope :notifiable, -> { where.not("notification_period @> ?", "{0}") }
end
