class UsersController < ApplicationController

    before_action :find_and_set_user, only: [:show, :edit]

    def index
        @users = User.all
    end

    def new
        @user = User.new
    end

    def create
    end
    
    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def find_and_set_user
        @user = User.find_by_id(params[:id])
    end

end
