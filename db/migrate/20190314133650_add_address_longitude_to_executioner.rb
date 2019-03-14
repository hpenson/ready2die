class AddAddressLongitudeToExecutioner < ActiveRecord::Migration[5.1]
  def change
    add_column :executioners, :address_longitude, :float
  end
end
