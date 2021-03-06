class UsersController < ApplicationController

    skip_before_action :redirect_if_not_logged_in, only: [:new, :create]
    before_action :find_and_set_user, only: [:show, :edit, :update, :destroy]

    def index
        # users_path
        # GET /users

        @users = User.all
    end
        
    def new
        # signup_path
        # GET /signup

        redirect_if_logged_in
        if !logged_in?
            @user = User.new
            render layout: "home"
        end
    end

    def create
        # users_path
        # POST /users

        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new, layout: "home"
        end
    end
    
    def show
        # user_path
        # GET /users/:id
    end

    def edit
        # edit_user_path
        # GET /users/:id/edit
        
        redirect_if_not_authorized_to_view(@user)
    end

    def update
        # user_path
        # PATCH	/users/:id

        @user.update(user_params)
        if @user.valid?
            redirect_to @user
        else
            render :edi
        end
    end

    def destroy
        # user_path
        # DELETE /users/:id
        
        @user.destroy
        session.delete(:user_id)
        redirect_to root_path
    end

    private

    def find_and_set_user
        @user = User.find_by_id(params[:id])
    end

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
