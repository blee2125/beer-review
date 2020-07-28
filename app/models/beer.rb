class Beer < ApplicationRecord
    has_many :ratings
    has_many :users, through: :ratings
    has_many :comments
    has_many :users, through: :comments

    has_one_attached :beer_picture
    
end
