class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.integer :venue_id
      t.integer :user_id
      t.integer :theme_id
      t.integer :rank
      t.string :casket

      t.timestamps
    end
  end
end
