class AddGuestCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :guests_count, :integer
  end
end
