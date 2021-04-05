class WateringsController < ApplicationController

    before_action :find_and_set_user
    before_action :find_and_set_plant
    before_action :find_and_set_watering, only: [:show, :edit, :update, :destroy]

    def index
        @waterings = @plant.waterings
    end

    def new
        @watering = @plant.waterings.build
    end

    def create
    end
    
    def show
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def find_and_set_user
        @user = User.find_by_id(params[:user_id])
    end

    def find_and_set_plant
        @plant = Plant.find_by(id: params[:plant_id], user_id: @user)
    end

    def find_and_set_watering
        @watering = Watering.find_by(id: params[:id], plant_id: @plant)
    end

end