class AddRoleCountToGuests < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :roles_count, :integer
  end
end
