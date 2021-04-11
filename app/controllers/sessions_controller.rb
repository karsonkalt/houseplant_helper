class SessionsController < ApplicationController

    skip_before_action :redirect_if_not_logged_in

    layout "home"

    def new
        # login_path
        # GET /login

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

end
