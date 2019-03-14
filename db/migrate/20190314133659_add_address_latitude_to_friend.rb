class AddAddressLatitudeToFriend < ActiveRecord::Migration[5.1]
  def change
    add_column :friends, :address_latitude, :float
  end
end
