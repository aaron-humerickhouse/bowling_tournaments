module Notifications
  class NightlyNotifyJob
    include Sidekiq::Worker

    def perform(tournament_id:)
      Notifications::Service.new.tournament_notify(id: tournament_id)
    end
  end
end
