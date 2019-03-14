class CreatePhotos < ActiveRecord::Migration[5.1]
  def change
    create_table :photos do |t|
      t.string :image
      t.string :caption
      t.string :description
      t.integer :rank
      t.integer :user_id

      t.timestamps
    end
  end
end
