class AddAddressLatitudeToExecutioner < ActiveRecord::Migration[5.1]
  def change
    add_column :executioners, :address_latitude, :float
  end
end
