class RepliesMailbox < ApplicationMailbox
  MATCHER = /reply-(.+)@reply.example.com/i

  before_processing :ensure_user
    

  def process
    return if user.nil? 

    album.create(
      user: user,
      body: mail.decode
    )


  end

  def user
    @user = User.find_by(email: mail.from)
  end

  def ensure_user
    if user.nil?
      bounce_with UserMailer.missing(inbound_email)
  end
end
