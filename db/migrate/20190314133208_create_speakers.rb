class CreateSpeakers < ActiveRecord::Migration[5.1]
  def change
    create_table :speakers do |t|
      t.integer :rank
      t.integer :guest_id
      t.string :position
      t.string :description

      t.timestamps
    end
  end
end
