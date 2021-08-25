module Notifications
  class NightlyNotifyJob
    include Sidekiq::Worker

    def perform
      Notifications::Service.new.nightly_notify
    end
  end
end
