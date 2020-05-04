class AddPublishToAlbums < ActiveRecord::Migration[6.0]
  def change
    add_column :albums, :publish, :boolean , default: false
  end
end
