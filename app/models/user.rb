class User < ApplicationRecord
    has_secure_password
    has_many :beers
    has_many :comments
    has_many :ratings, through: :beers

end
