class AddAddressLongitudeToGift < ActiveRecord::Migration[5.1]
  def change
    add_column :gifts, :address_longitude, :float
  end
end
