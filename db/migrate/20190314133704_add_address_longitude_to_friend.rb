class AddAddressLongitudeToFriend < ActiveRecord::Migration[5.1]
  def change
    add_column :friends, :address_longitude, :float
  end
end
