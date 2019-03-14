class AddAddressLatitudeToGuest < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :address_latitude, :float
  end
end
