class AddAlbumIdToReacts < ActiveRecord::Migration
  def change
    add_column :reacts, :album_id, :integer
  end
end
