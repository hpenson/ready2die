class AddAddressLongitudeToAppointee < ActiveRecord::Migration[5.1]
  def change
    add_column :appointees, :address_longitude, :float
  end
end
