class CreateFriends < ActiveRecord::Migration[5.1]
  def change
    create_table :friends do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :email
      t.string :phone
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
