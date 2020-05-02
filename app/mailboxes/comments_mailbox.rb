class CommentsMailbox < ApplicationMailbox
  def process
    album = find_album(mail.subject)
    update_comments(album, mail.decoded)
  end


  private

  def update_comments(album, comment_string)
    album.comments.create!(note: comment_string)
  end

  def find_album(subject)
    album_id = subject.split("-").last.to_i
    Album.find(album_id)
  end
end
