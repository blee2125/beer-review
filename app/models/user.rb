class User < ApplicationRecord
    has_many :beers
    has_many :comments
    has_many :ratings, through: :beers

end
