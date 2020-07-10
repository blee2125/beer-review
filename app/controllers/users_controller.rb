class UsersController < ApplicationController

    def new
        @user= User.new
    end

    def create

    end

    def show
        @user= User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :location)
    end

end
