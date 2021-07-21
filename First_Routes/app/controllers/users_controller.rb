class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
        # render plain: "I am in the index action!"
    end

    def create
        user = User.new(params.require(:user).permit(:email, :name))
        # replace the `user_attributes_here` with the actual attribute keys
        user.save!
        render json: user
    end

    def show
        render json: params
    end
end