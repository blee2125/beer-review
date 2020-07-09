class User < ApplicationRecord
    has_many :beers
    has_many :ratings, through: :beers

end
