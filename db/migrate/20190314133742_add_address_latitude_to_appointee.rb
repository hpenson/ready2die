class AddAddressLatitudeToAppointee < ActiveRecord::Migration[5.1]
  def change
    add_column :appointees, :address_latitude, :float
  end
end
