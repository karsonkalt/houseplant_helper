class UsersController < ApplicationController

    before_action :find_and_set_user, only: [:show, :edit, :update]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            render :new
        end
    end
    
    def show
    end

    def edit
    end

    def update
        @user.update(user_params)
        if @user.valid?
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
    end

    private

    def find_and_set_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email)
    end

end
