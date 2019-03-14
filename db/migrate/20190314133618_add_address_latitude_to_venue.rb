class AddAddressLatitudeToVenue < ActiveRecord::Migration[5.1]
  def change
    add_column :venues, :address_latitude, :float
  end
end
