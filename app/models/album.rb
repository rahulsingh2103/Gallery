class Album < ApplicationRecord
    paginates_per 2
    belongs_to :user
    has_many_attached :images
  

    validates :title, presence: true
    validates :discription, presence: true
    #validates :image_type 

    def thumbnail input
        return self.images[input].variant(resize: '300x400!').processed
    end


end

