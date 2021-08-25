# frozen_string_literal: true

schedule_file = 'config/schedule.yml'
return unless File.exist?(schedule_file) && Sidekiq.server?

Redis.exists_returns_integer =  true
Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file)
