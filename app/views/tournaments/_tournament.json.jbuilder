# frozen_string_literal: true

json.extract! tournament, :id, :name, :alley_id, :starts_at, :format, :participants, :flyer_url, :host_id,
              :created_at, :updated_at
json.url tournament_url(tournament, format: :json)
