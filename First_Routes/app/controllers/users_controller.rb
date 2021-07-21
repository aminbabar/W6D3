class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
        # render plain: "I am in the index action!"
    end

    def create
        user = User.new(user_params)
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


    def update
        @user = User.update(params[:id], user_params)
        render json: @user
    end


    def destroy
        User.delete(params[:id])
        redirect_to users_url
    end

    private

    def user_params
        params.require(:user).permit(:email, :name)
    end


end