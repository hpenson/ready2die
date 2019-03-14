class AddAddressLongitudeToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :address_longitude, :float
  end
end
