class UsersController < ApplicationController

    def index

        # debugger
        if params.include?(:query)
            @user = User.find_by(username: params[:query])
            render json: @user
        else
            @users = User.all
            render json: @users
        end

        
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
        # @id = params[:id]
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end


    def destroy
        debugger
        User.destroy(params[:id])
        redirect_to users_url
    end

    private

    def user_params
        params.require(:user).permit(:username)
    end


end