class CreateDiscretions < ActiveRecord::Migration[5.1]
  def change
    create_table :discretions do |t|
      t.string :title
      t.string :description
      t.string :instruction
      t.integer :user_id
      t.integer :apppointee_id

      t.timestamps
    end
  end
end
