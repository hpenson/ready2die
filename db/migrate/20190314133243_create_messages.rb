class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :description
      t.string :receipient
      t.string :address
      t.string :email
      t.string :phone
      t.string :content
      t.string :audio
      t.string :video
      t.integer :user_id
      t.string :photo

      t.timestamps
    end
  end
end
