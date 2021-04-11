class ApplicationController < ActionController::Base

    before_action :redirect_if_not_logged_in

    private

    #TODO These methods could be moved to a helper? They aren't available when inside aplication helper

    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
    end

    def logged_in?
        !!current_user
    end

    def redirect_if_not_logged_in
        if !logged_in?
            redirect_to root_path
        end
    end

end
