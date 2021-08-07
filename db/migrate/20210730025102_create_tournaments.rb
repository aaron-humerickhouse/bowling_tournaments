class CreateTournaments < ActiveRecord::Migration[6.1]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.references :alley, null: false, foreign_key: true
      t.datetime :starts_at
      t.string :format, array: true
      t.string :participants, array: true
      t.string :difficulty
      t.string :flyer_url
      t.references :host, null: false, foreign_key: true

      t.timestamps
    end

    add_index :tournaments, %i[name alley_id starts_at]
  end
end
