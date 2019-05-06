class AddCordsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :lat, :float
    add_column :events, :lng, :float
  end
end
