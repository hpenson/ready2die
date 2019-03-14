class AddAddressFormattedAddressToFriend < ActiveRecord::Migration[5.1]
  def change
    add_column :friends, :address_formatted_address, :string
  end
end
