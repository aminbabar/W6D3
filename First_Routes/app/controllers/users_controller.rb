class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
        # render plain: "I am in the index action!"
    end

    def create
        user = User.new(params.require(:user).permit(:email, :name))
        # replace the `user_attributes_here` with the actual attribute keys
        if user.save
            render json: user
        else 
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        render json: @user
    end

    
end