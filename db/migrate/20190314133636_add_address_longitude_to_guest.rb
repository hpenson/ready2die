class AddAddressLongitudeToGuest < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :address_longitude, :float
  end
end
