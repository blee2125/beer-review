class StaticController < ApplicationController
    skip_before_action :verified_user, only: [:home]

    def home
        @random_beer = Beer.all.sample
        @top_five_beers= Beer.all.sort_by_ratings.reverse.first(5)
    end

end
