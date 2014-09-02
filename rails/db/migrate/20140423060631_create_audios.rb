class CreateAudios < ActiveRecord::Migration
  def change
    create_table :audios do |t|
      t.string :code
      t.string :title
      t.string :artist

      t.timestamps
    end
  end
end
