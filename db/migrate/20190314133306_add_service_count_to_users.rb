class AddServiceCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :services_count, :integer
  end
end
