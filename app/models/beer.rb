class Beer < ApplicationRecord
    has_many :comments
    has_many :users, through: :comments

    has_one_attached :beer_picture

    validates :name, uniqueness: true
    
    def recommended
        self.comments.where(recommend: true).count * 100 / self.comments.count if self.comments.count > 0
    end

    def self.sort_by_ratings
        self.all.where.not(rating: nil).sort_by(&:rating)
    end

end
