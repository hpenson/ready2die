class AddAddressLatitudeToGift < ActiveRecord::Migration[5.1]
  def change
    add_column :gifts, :address_latitude, :float
  end
end
