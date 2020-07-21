class CommentsController < ApplicationController

    def index
        @beer= Beer.find_by(id: params[:beer_id])
        @comments= Comment.find_by(beer_id: params[:beer_id])
    end

    def show
        @comment= Comment.find_by(id: params[:id])
    end

    def new
        @beer= Beer.find_by(params[:id])
        @comment= @beer.comments.build
    end

    def create
        @user= current_user.id
        @comment= Comment.create(comment_params)
        if @comment.save
            @beer= Beer.find_by(id: params[:beer_id])
            redirect_to beer_comments_path(@beer)
        else
            render :new
        end
    end

    private

    def comment_params
        params.require(:comment).permit(:comment, :user_id, :beer_id)
    end

end
