class AddUserToAlbum < ActiveRecord::Migration[6.0]
  def change
    
    add_reference :albums, :user, foreign_key: true
  end
end
