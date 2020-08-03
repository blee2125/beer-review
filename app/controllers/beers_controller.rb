class BeersController < ApplicationController

    def index
        @beers= Beer.all
    end

    def show
        @beer= Beer.find_by(id: params[:id])
    end

    def new
        @beer= Beer.new
    end

    def create
        @beer= Beer.create(beer_params)
        if @beer.save
            flash[:alert]= "NEW BEER CREATED"
            redirect_to beers_path(beer)
        else
            @rightbeer= Beer.find_by(name: params[:beer][:name])
            render :new
        end
    end

    def edit
        @beer= Beer.find_by(id: params[:id])
    end

    def update
        @beer= Beer.find_by(id: params[:id])
        if @beer.update(beer_params)
            flash[:alert]= "BEER UPDATED"
            redirect_to beer_path(@beer)
        else
            render :edit
        end
    end

    private

    def beer_params
        params.require(:beer).permit(:name, :brewery, :origin, :style, :abv, :id, :beer_picture)
    end
    
end
