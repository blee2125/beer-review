class BeersController < ApplicationController

    def index
        @beers= Beer.all
    end

    def show
        @beer= Beer.find_by(id: params[:id])
        @comment= @beer.comments
    end

    def new
        @beer= Beer.new
    end

    def create
        beer= Beer.create(beer_params)
        flash[:alert]= "NEW BEER CREATED"
        redirect_to beers_path(beer)
    end

    private

    def beer_params
        params.require(:beer).permit(:name, :brewery, :origin, :style, :abv, :id)
    end
    
end
