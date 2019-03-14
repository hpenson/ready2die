class AddAddressFormattedAddressToAppointee < ActiveRecord::Migration[5.1]
  def change
    add_column :appointees, :address_formatted_address, :string
  end
end
