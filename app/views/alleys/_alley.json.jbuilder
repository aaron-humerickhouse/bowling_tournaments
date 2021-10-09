# frozen_string_literal: true

json.extract! alley, :id, :name, :address_id, :created_at, :updated_at
json.url alley_url(alley, format: :json)
