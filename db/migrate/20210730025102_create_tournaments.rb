class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.references :alley, null: false, foreign_key: true
      t.datetime :starts_at
      t.string :events, array: true
      t.string :participants, array: true
      t.string :difficulty
      t.string :flyer_url
      t.string :contact_email, null: true
      t.string :contact_phone, null: true
      t.string :contact_name, null: false

      t.timestamps
    end

    add_index :tournaments, %i[name alley_id starts_at]
  end
end
