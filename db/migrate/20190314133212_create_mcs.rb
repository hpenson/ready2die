class CreateMcs < ActiveRecord::Migration[5.1]
  def change
    create_table :mcs do |t|
      t.integer :rank
      t.integer :guest_id

      t.timestamps
    end
  end
end
