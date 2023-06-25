class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

        if @user.save
            render json: @user, status: :created
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy

        head :no_content
    end

    def get_user
        @user = User.find(params[:id])
        
        if @user
            render json: @user, status: :ok
        else
            head :no_content
        end

    end

    def update
        @user = User.find(params[:id])

        if @user.update(user_params)
            render json: @user
        else
            render json: @user.errors, status: :unprocessable_entity
        end
    end

    def get_all_users
        @users = User.all
        render json: @users
    end

    def destroy_all_users
        User.destroy_all
        head :no_content
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end
end