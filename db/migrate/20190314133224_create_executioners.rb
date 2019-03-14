class CreateExecutioners < ActiveRecord::Migration[5.1]
  def change
    create_table :executioners do |t|
      t.string :last_name
      t.string :first_name
      t.string :address
      t.string :email
      t.string :phone
      t.string :instruction
      t.integer :user_id

      t.timestamps
    end
  end
end
