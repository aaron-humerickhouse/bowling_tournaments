# frozen_string_literal: true

class AddPhoneNumberToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :phone_number, :string, null: true
  end
end
