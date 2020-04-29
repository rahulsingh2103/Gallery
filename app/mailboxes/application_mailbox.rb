class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere

  routing :all => :replies
  routing RepliesMailbox::MATCHER => :replies
end
