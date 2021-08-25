module Notifications
  class Mailer < ActionMailer::Base
    default from: 'from@example.com'

    def nightly_notify(user:, tournament:)
      @user = user
      @tournament = tournament
      mail(to: @user.email, subject: 'Tournament Reminder')
    end
  end
end
