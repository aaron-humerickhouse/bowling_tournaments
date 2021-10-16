class Coppa < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :coppa_check, :boolean, default: false
    add_column :users, :coppa_agreement, :string, default: ''
  end
end
