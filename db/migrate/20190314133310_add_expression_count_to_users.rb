class AddExpressionCountToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :expressions_count, :integer
  end
end
