class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.string :upload
      t.string :description
      t.string :caption
      t.integer :rank
      t.integer :user_id

      t.timestamps
    end
  end
end
