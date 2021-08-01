class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end

    add_index :contacts, %i[name email phone]
  end
end
