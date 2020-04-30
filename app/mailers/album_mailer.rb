class AlbumMailer < ApplicationMailer
  before_action :authenticate_user!, except: [:destroy_album, :create_album]

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.album_mailer.destroy_album.subject
  #
  def destroy_album(album)
    mail to: album.user.email, 
         subject: "Album has been deleted"                 
  end

  def create_album(album)
    mail to: album.user.email, 
         subject: "Album has been created"                 
  end

end
