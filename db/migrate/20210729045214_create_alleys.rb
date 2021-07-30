class CreateAlleys < ActiveRecord::Migration[6.1]
  def change
    create_table :alleys do |t|
      t.string :name, null: false
      t.references :address, null: false, foreign_key: true

      t.timestamps
    end
  end
end
