class CreateRemains < ActiveRecord::Migration[5.1]
  def change
    create_table :remains do |t|
      t.string :portion
      t.string :wish
      t.integer :user_id

      t.timestamps
    end
  end
end
