# frozen_string_literal: true

class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :street_address, null: false
      t.string :secondary_address
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip_code, null: false

      t.timestamps
    end

    add_index :addresses, %i[street_address secondary_address city state zip_code], unique: true,
                                                                                    name: :index_on_full_address
  end
end
