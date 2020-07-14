class UsersController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]


    def new
        @user= User.new
    end

    def create
        user= User.create(user_params)
        redirect_to user_path(user)
    end

    def show
        @user= User.find_by(id: params[:id])
    end

    private

    def user_params
        params.require(:user).permit(:name, :username, :email, :location)
    end

end
