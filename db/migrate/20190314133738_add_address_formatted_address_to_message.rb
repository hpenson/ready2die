class AddAddressFormattedAddressToMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :address_formatted_address, :string
  end
end
