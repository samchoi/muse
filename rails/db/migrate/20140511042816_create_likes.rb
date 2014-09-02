class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.integer :audio_id
      t.integer :user_id
      t.string :data

      t.timestamps
    end
  end
end
