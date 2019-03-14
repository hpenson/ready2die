class CreateRoles < ActiveRecord::Migration[5.1]
  def change
    create_table :roles do |t|
      t.string :kind
      t.string :description
      t.integer :rank
      t.integer :guest_id

      t.timestamps
    end
  end
end
