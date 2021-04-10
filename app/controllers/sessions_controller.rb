class SessionsController < ApplicationController

    skip_before_action :redirect_if_not_logged_in

    def new
        # login_path
        # GET /login

    end

    def create
        # login_path
        # POST /login

    end

    def destroy
        # logout_path
        # GET /logout
        
        redirect_to root_path
    end

end
