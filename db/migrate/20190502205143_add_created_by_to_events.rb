class AddCreatedByToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :created_by, :string
  end
end
