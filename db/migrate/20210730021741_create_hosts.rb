class CreateHosts < ActiveRecord::Migration[6.1]
  def change
    create_table :hosts do |t|
      t.string :name
      t.string :email
      t.string :phone

      t.timestamps
    end

    add_index :hosts, %i[name email phone]
  end
end
