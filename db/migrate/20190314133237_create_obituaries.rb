class CreateObituaries < ActiveRecord::Migration[5.1]
  def change
    create_table :obituaries do |t|
      t.string :description
      t.string :outlet
      t.integer :user_id
      t.integer :rank

      t.timestamps
    end
  end
end
