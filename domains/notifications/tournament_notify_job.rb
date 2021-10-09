# frozen_string_literal: true

module Notifications
  class TournamentNotifyJob
    include Sidekiq::Worker

    def perform(user_id, tournament_id)
      user = User.find(user_id)
      tournament = Tournament.find(tournament_id)
      puts "Mailing user #{user.id} about tournament #{tournament.name}"

      Notifications::Mailer.tournament_notify(user: user, tournament: tournament).deliver_now
    end
  end
end
