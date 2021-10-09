# frozen_string_literal: true

module Notifications
  class Service
    # Scan for tournaments that fall within the notifiable window
    def nightly_notify
      # TODO: user setting service
      UserSetting.notifiable.each do |user_setting|
        notifiable_windows(user_setting).each do |notifiable_window|
          # TODO: tournament service
          tournaments = Tournament.where(starts_at: notifiable_window)
          tournaments.each do |tournament|
            Notifications::Mailer.nightly_notify(user: user_setting.user, tournament: tournament).deliver_now
          end
        end
      end
    end

    # Notify when a tournament is created if it's within the notifiable period
    def tournament_notify(id:)
      puts 'In tournament_notify'
      tournament = Tournament.find(id)
      # TODO: Can we use a sql query to prevent searching over all users
      User.all.each do |user|
        puts "Checking user #{user.id} if notifiable"
        next unless user.notify_for_tournament?(tournament: tournament)

        puts "User #{user.id} is notifiable"
        puts "Setting up mail to user #{user.id} about tournament #{tournament.name}"
        Notifications::TournamentNotifyJob.perform_in(1.minute, user.id, tournament.id)
      end
    end

    private

    def notifiable_windows(user_setting)
      user_setting.notification_period.map do |period|
        start_day = period.days.from_now.beginning_of_day
        [start_day..start_day + 1.day]
      end
    end
  end
end
