class AddKarmaToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :karma, :integer, :default => 0
  end
end
