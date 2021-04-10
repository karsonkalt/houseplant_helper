module ApplicationHelper

    # Sessions Helpers

    def current_user
        @current_user ||= User.find_by_id(session[:user])
    end

    def logged_in?
        !!current_user
    end




    def display_errors_if_any(object)
        if object.errors.any?
            @object = object
            render partial: "shared/errors"
        end
    end


end
