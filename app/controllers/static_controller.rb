class StaticController < ApplicationController
    skip_before_action :verified_user, only: [:home]

    def home
        @random_beer = Beer.all.sample
    end

end
