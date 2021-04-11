class HomeController < ApplicationController

    skip_before_action :redirect_if_not_logged_in

    def index
        if logged_in?
            redirect_to user_plants_path(current_user)
        else
            render layout:false
        end
    end

end
