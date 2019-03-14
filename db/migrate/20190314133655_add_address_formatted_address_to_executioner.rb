class AddAddressFormattedAddressToExecutioner < ActiveRecord::Migration[5.1]
  def change
    add_column :executioners, :address_formatted_address, :string
  end
end
