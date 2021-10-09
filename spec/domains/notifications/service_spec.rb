# frozen_string_literal: true

require 'rails_helper'

describe Notifications::Service do
  describe '.nightly_notify' do
    let(:first_notification_period) { 60 }
    let(:second_notification_period) { 7 }
    let(:not_a_notification_period) { 59 }

    let!(:notification_user) do
      create(:user_setting, notification_period: [first_notification_period, second_notification_period])
    end
    let!(:no_notification_user) { create(:user_setting, notification_period: [0]) }

    let!(:first_day_plus) { create(:tournament, starts_at: (first_notification_period + 1).days.from_now) }
    let!(:first_day) { create(:tournament, starts_at: first_notification_period.days.from_now) }
    let!(:first_day_minus) { create(:tournament, starts_at: (first_notification_period - 1).days.from_now) }
    let!(:second_day_plus) { create(:tournament, starts_at: (second_notification_period + 1).days.from_now) }
    let!(:second_day) { create(:tournament, starts_at: second_notification_period.days.from_now) }
    let!(:second_day_minus) { create(:tournament, starts_at: (second_notification_period - 1).days.from_now) }
    let!(:day_of) { create(:tournament, starts_at: 0.days.from_now) }
    let!(:yesterday) { create(:tournament, starts_at: 1.day.ago) }

    subject { Notifications::Service.new.nightly_notify }

    xit 'notifies using the notification period day' do
      NotificationMailer.with(tournament: first_day).nightly_notify.deliver_now
      # UserMailer.with(user: user).weekly_summary.deliver_now
    end
  end
end
