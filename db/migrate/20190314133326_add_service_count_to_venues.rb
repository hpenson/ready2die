class AddServiceCountToVenues < ActiveRecord::Migration[5.1]
  def change
    add_column :venues, :services_count, :integer
  end
end
