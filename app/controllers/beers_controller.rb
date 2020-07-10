class BeersController < ApplicationController

    def index
        @beer= Beer.all
    end

    def show
        @beer= Beer.find_by(id: params[:id])
    end

    def new
        @beer= Beer.new
    end

    def create
        beer= Beer.create(beer_params)
        redirect_to beers_path(beer)
    end

    private

    def beer_params
        params.require(:beer).permit(:name, :brewery, :origin, :style, :abv)
    end
    
end
