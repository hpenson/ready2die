class CreateGifts < ActiveRecord::Migration[5.1]
  def change
    create_table :gifts do |t|
      t.string :receipient
      t.string :address
      t.string :email
      t.string :kind
      t.integer :user_id

      t.timestamps
    end
  end
end
