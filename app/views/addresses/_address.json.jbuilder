json.extract! address, :id, :street_address, :secondary_address, :city, :state, :zip_code, :created_at, :updated_at
json.url address_url(address, format: :json)
