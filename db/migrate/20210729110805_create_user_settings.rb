# frozen_string_literal: true

class CreateUserSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_settings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :notification_search_radius, null: false
      t.integer :notification_period, array: true, null: false, default: []
      t.string :zip_code, null: false

      t.timestamps
    end
  end
end
