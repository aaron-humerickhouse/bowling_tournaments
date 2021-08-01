class CreateAlleys < ActiveRecord::Migration[6.1]
  def change
    create_table :alleys do |t|
      t.string :name, null: false, unique: true
      t.references :address, null: false, foreign_key: true
      t.string :phone_number, unique: true

      t.timestamps
    end

    add_index :alleys, %i[name address_id], unique: true
  end
end
