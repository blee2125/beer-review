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

end
