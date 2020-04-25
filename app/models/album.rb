class Album < ApplicationRecord
    paginates_per 3
    belongs_to :user
    has_many_attached :images

    validates :title, presence: true
    validates :discription, presence: true
    validates :images, presence: true 

    def thumbnail input
        return self.images[input].variant(resize: '300x400!').processed
    end


end

