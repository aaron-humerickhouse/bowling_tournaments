class CreateUserSettings < ActiveRecord::Migration[6.1]
  def change
    create_table :user_settings do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :notification_search_radius
      t.integer :notification_period, array: true

      t.timestamps
    end
  end
end
