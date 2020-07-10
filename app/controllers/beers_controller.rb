class BeersController < ApplicationController

    def index

    end

    def show

    end

    def new
        @beer= Beer.new
    end

    def create

    end

    private

    def beer_params
        params.require(:beer).permit(:name, :brewery, :origin, :style, :abv)
    end
    
end
