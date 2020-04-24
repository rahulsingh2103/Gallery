class Search < ApplicationRecord

    def search_albums

        albums = Album.all
      
        albums = users.where(["user LIKE ?" "%#{user}%"]) if user.present?
        albums = albums.where(["title LIKE ?" "%#{title}%"]) if title.present?
        albums = albums.where(["discription LIKE ?" "%#{description}%"]) if description.present?
        albums = albums.where(["tag LIKE ?" "%#{tag}%"]) if tag.present?

        return albums
    end


end
