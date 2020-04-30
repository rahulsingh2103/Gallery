# Preview all emails at http://localhost:3000/rails/mailers/album_mailer
class AlbumMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/album_mailer/destroy_album

  def destroy_album
    album = Album.last
    AlbumMailer.destroy_album(album)
  end

  def create_album
    album = Album.last
    AlbumMailer.create_album(album)
  end

  def edit_album
    album = Album.last
    AlbumMailer.edit_album(album)
  end


end
