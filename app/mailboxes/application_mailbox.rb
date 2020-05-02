class ApplicationMailbox < ActionMailbox::Base
  routing :all => :comments
end
