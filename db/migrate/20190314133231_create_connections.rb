class CreateConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :connections do |t|
      t.string :why
      t.integer :afriend_id
      t.integer :bfriend_id
      t.integer :user_id

      t.timestamps
    end
  end
end
