class AddImageToReact < ActiveRecord::Migration
  def change
    add_column :reacts, :image, :string
  end
end
