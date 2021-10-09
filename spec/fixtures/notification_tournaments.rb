# frozen_string_literal: true

FactoryBot.create(:user_setting, notification_period: [60, 7])
FactoryBot.create(:user_setting, notification_period: [0])

FactoryBot.create(:tournament, name: '61 day tournament', starts_at: 61.days.from_now)
FactoryBot.create(:tournament, name: '60 day tournament', starts_at: 60.days.from_now)
FactoryBot.create(:tournament, name: '59 day tournament', starts_at: 59.days.from_now)
FactoryBot.create(:tournament, name: '15 day tournament', starts_at: 15.days.from_now)
FactoryBot.create(:tournament, name: '14 day tournament', starts_at: 14.days.from_now)
FactoryBot.create(:tournament, name: '13 day tournament', starts_at: 13.days.from_now)
FactoryBot.create(:tournament, name: '0 day tournament', starts_at: 0.days.from_now)
FactoryBot.create(:tournament, name: '-1 day tournament', starts_at: 1.day.ago)
