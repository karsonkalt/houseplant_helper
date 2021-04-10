class WateringsController < ApplicationController

    before_action :find_and_set_user
    before_action :find_and_set_plant, only: [:index, :new]
    before_action :find_and_set_watering, only: [:show, :edit, :update, :destroy]

    def index
        # plant_waterings_path
        # GET /plants/:plant_id/waterings

        @waterings = @plant.waterings
    end

    def new
        # new_plant_watering_path
        # GET /plants/:plant_id/waterings/new

        @watering = @plant.waterings.build
    end

    def create
        # plant_waterings_path
        # POST /plants/:plant_id/waterings

    end
    
    def show
        # watering_path
        # GET /waterings/:id

    end

    def edit
        # edit_watering_path
        # GET /waterings/:id/edit

    end

    def update
        # watering_path
        # PATCH /waterings/:id

    end

    def destroy
        # watering_path
        # DELETE /waterings/:id

    end

    private

    def find_and_set_plant
        @plant = Plant.find_by_id(params[:plant_id])
    end

    def find_and_set_watering
        @watering = Watering.find_by_id(params[:id])
    end

end