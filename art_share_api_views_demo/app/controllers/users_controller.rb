class UsersController < ApplicationController
    
    def new
        @user = User.new # let us autopopulate fields
        render :new 
    end

    def index
        @users = User.all
        render :index 
    end
    
    def create
        # makes a container called user, and the keys inside are name and email 
        user = User.new(user_params)
        if user.save
            render json: user # redirect_to user_url(@user) -> for show 
                              # redirect_to_user_url -> for index 
        else
            render json: user.errors.full_messages, status: :unprocessable_entity 
        end
    end

    def show
        @user = User.find(id: params[:id])
        render json: @user 
    end

    def edit
        @user = User.find_by(id: params[:id])
        render :edit 
    end

    def update
        @user = User.find(id: params[:id])
        if @user.update(user_params)
            render json: @user 
        else 
            render json: @user.errors.full_messages, status: :unprocessable_entity 
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        # redirect_to @user_url
        render json: @user 
    end

    private 

    def user_params
        params.require(:user).permit(:username) 
    end
    
end

