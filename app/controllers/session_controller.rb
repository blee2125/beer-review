class SessionController < ApplicationController
    skip_before_action :verified_user, only: [:new, :create, :omniauth]

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

    def omniauth
        @user = User.find_or_create_by(id: auth[:'uid']) do |u|
            u.username= auth['extra']['raw_info']['username']
            u.name= auth['info']['name']
            u.email= auth['info']['email']
            u.id= auth['extra']['raw_info']['id']
            u.password= SecureRandom.hex
        end
        if @user.save
            session[:user_id] = @user.id
            if @user.username == nil
                flash[:alert]= "PLEASE COMPLETE PROFILE"
                redirect_to edit_user_path(@user)
            else
                redirect_to user_path(@user)
            end
        else
            redirect_to signin_path
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end
    

end
