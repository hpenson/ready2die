class CreatePallBearers < ActiveRecord::Migration[5.1]
  def change
    create_table :pall_bearers do |t|
      t.integer :guest_id
      t.integer :rank

      t.timestamps
    end
  end
end
