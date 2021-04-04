class PlantsController < ApplicationController
    def index
    end

    def new
    end

    def create
    end
    
    def show
        @plant = Plant.find_by(id: params[:id], user_id: params[:user_id])
    end

    def edit
    end

    def update
    end

    def destroy
    end
end
