class AddThumbUrlToAudios < ActiveRecord::Migration
  def change
    add_column :audios, :thumb_url, :string
  end
end
