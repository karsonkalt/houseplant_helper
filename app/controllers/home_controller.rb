class HomeController < ApplicationController

    skip_before_action :redirect_if_not_logged_in

    def index
        render layout:false
    end

end
