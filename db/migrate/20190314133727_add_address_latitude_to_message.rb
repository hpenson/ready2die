class AddAddressLatitudeToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :address_latitude, :float
  end
end
