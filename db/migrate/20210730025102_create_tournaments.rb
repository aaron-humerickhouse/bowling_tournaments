class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.references :alley, null: false, foreign_key: true
      t.datetime :starts_at
      t.string :format, array: true
      t.string :participants, array: true
      t.string :flyer_url
      t.references :contact, null: false, foreign_key: true

      t.timestamps
    end
  end
end
