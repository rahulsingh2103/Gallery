class Home < ApplicationRecord

    def thumbnail input
        return self.images[input].variant(resize: '300x400!').processed
    end

end