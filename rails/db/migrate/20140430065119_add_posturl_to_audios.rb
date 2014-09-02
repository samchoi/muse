class AddPosturlToAudios < ActiveRecord::Migration
  def change
    add_column :audios, :posturl, :string
  end
end
