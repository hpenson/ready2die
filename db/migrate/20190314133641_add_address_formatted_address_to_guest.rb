class AddAddressFormattedAddressToGuest < ActiveRecord::Migration[5.1]
  def change
    add_column :guests, :address_formatted_address, :string
  end
end
