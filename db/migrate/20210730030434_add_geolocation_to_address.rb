# frozen_string_literal: true

class AddGeolocationToAddress < ActiveRecord::Migration[6.1]
  def change
    add_column :addresses, :latitude, :float
    add_column :addresses, :longitude, :float
  end
end
