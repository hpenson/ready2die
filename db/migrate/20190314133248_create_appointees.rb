class CreateAppointees < ActiveRecord::Migration[5.1]
  def change
    create_table :appointees do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :address
      t.string :phone
      t.integer :discretion_id

      t.timestamps
    end
  end
end
