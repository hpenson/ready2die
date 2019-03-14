class CreateExpressions < ActiveRecord::Migration[5.1]
  def change
    create_table :expressions do |t|
      t.string :kind
      t.string :description
      t.integer :rank
      t.integer :service_id
      t.integer :user_id

      t.timestamps
    end
  end
end
