# frozen_string_literal: true

class AddIndexToArrayTournament < ActiveRecord::Migration[6.1]
  def change
    add_index :tournaments, :events, using: 'gin'
    add_index :tournaments, :participants, using: 'gin'
  end
end
