class AddAddressFormattedAddressToGift < ActiveRecord::Migration[5.1]
  def change
    add_column :gifts, :address_formatted_address, :string
  end
end
