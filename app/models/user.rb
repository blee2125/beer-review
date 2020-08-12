class User < ApplicationRecord
    has_secure_password
    has_many :comments
    has_many :beers, through: :comments

    validates :username, uniqueness: true
end
