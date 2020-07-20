class CommentsController < ApplicationController

    def index
        @beer= Beer.find_by(params[:id])
        @comments= @beer.comments
    end

    def show
        @comment= Comment.find_by(id: params[:id])
    end

    def new
        @beer= Beer.find_by(params[:id])
        
        @comment= Comment.new
    end

    def create
        @user= current_user.id
        new_comment= Comment.new(comment: params[:comment][:comment], beer_id: params[:beer_id], user_id: @user)
        new_comment.save
        redirect_to beer_comments_path
    end

    private

    def comment_params
        params.require(:comment).permit(:comment, :user_id, :beer_id)
    end

end
