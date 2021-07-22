class CommentsController < ApplicationController
    def create
        @comment = Comment.new(params_comments)
        
    end

    def destroy 
    end

    def index 
    end

    private 
    def params_comments
        params[:comment].permit(:user_id, :artwork_id, :body)
    end
end