class SessionsController < ApplicationController

    skip_before_action :redirect_if_not_logged_in

    layout "home"

    def new
        # login_path
        # GET /login

        redirect_if_logged_in
    end

    def create
        # login_path
        # POST /login

        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to root_path
        else
            redirect_to login_path
            # TODO Add some way to tell invalid credentials.
        end

    end

    def destroy
        # logout_path
        # GET /logout

        session.delete(:user_id)
        redirect_to root_path
    end

    def omniauth
        @user = User.find_or_create_by(uid: auth["uid"]) do |user|
            user.email = auth['info']['email']
            user.password = SecureRandom.hex(20)
            user.username = auth['info']['name'].downcase.gsub(" ", "_")
        end
        
        if @user.valid?
            session[:user_id] = @user.id
            redirect_to root_path
        else
            render :new
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end

end
