class SessionController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create]

    def new
        @user= User.new
    end

    def create
        @user= User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id]= @user.id
            redirect_to user_path(@user)
        else
            flash[:alert]= "WRONG USERNAME/PASSWORD"
            render 'new'
        end
    end

    def destroy
        session.delete("user_id")
        flash[:alert]= "YOU ARE LOGGED OUT"
        redirect_to root_path
    end

end
