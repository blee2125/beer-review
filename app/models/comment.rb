class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :beer

    def yesno
        if recommend == true
            return "Yes"
        else
            return "No"
        end
    end

    def update_rating_on_beer
        new_rating= self.beer.recommended
        self.beer.update(:rating => new_rating)
    end

end
