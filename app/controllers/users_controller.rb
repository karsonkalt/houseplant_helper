class UsersController < ApplicationController

    skip_before_action :redirect_if_not_logged_in, only: [:new]
    before_action :find_and_set_user, only: [:show, :edit, :update, :destroy]

    def index
        # users_path
        # GET /users

        @users = User.all
    end
        
    def new
        # signup_path
        # GET /signup

        @user = User.new

        render layout: "home"
    end

    def create
        # users_path
        # POST /users

        @user = User.new(user_params)
        if @user.save
            redirect_to @user
        else
            render :new
        end
    end
    
    def show
        # user_path
        # GET /users/:id
        
    end

    def edit
        # edit_user_path
        # GET /users/:id/edit

    end

    def update
        # user_path
        # PATCH	/users/:id

        @user.update(user_params)
        if @user.valid?
            redirect_to @user
        else
            render :edit
        end
    end

    def destroy
        # user_path
        # DELETE /users/:id
        
    end

    private

    def find_and_set_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email)
    end

end
