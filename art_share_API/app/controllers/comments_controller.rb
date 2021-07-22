class CommentsController < ApplicationController
    def create
        @comment = Comment.new(params_comments)
        if @comment.save
            render json: @comment
        else
            render json: @comment.errors.full_messages, status: 422
        end
    end

    def destroy 
        @comment = Comment.find(params[:id])
        @comment.destroy
        render json: @comment
    end

    def index

        @source = (params.include?(:user_id)) ? (User.find(params[:user_id])) : (Artwork.find(params[:artwork_id]))
        @comments = @source.comments
        render json: @comments

        # if params.include?(:user_id)
        #     # User.joins(:comments).where("user.id = ?", params[:user_id])
        #     @user = User.find(params[:user_id])
        #     @comments = @user.comments
        #     render json: comments

        #     # Comment.find_by(user_id: params[:user_id])
        # elsif params.include?(:artwork_id)
        #     @artwork = Artwork.find(params[:artwork_id])
        #     @comments = @artwork.comments
        #     render json: comments
        # end
        # @comments = Comment.all
        # render json: @comments
    end

    private 
    def params_comments
        params[:comment].permit(:user_id, :artwork_id, :body)
    end
end