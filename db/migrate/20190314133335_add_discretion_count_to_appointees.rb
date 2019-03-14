class AddDiscretionCountToAppointees < ActiveRecord::Migration[5.1]
  def change
    add_column :appointees, :discretions_count, :integer
  end
end
