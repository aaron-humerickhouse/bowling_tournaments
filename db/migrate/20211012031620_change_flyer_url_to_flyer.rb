class ChangeFlyerUrlToFlyer < ActiveRecord::Migration[6.1]
  def change
    remove_column :tournaments, :flyer_url
  end
end
