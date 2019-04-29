class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.string :description
      t.string :user_id
      t.string :event_id

      t.timestamps
    end
  end
end
