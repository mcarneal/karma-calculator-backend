class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :location
      t.string :description
      t.string :comment_id
      t.string :user_id

      t.timestamps
    end
  end
end
