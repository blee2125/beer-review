class User < ApplicationRecord
    has_secure_password
    has_many :ratings
    has_many :beers, through: :ratings
    has_many :comments
    has_many :beers, through: :comments

end
