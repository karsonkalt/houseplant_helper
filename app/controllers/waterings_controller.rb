class WateringsController < ApplicationController

    before_action :find_and_set_plant, only: [:index, :new, :create]
    before_action :find_and_set_watering, only: [:show, :edit, :update, :destroy]

    def index
        # plant_waterings_path
        # GET /plants/:plant_id/waterings

        @waterings = @plant.waterings
    end

    def new
        # new_plant_watering_path
        # GET /plants/:plant_id/waterings/new

        user = @plant.user
        redirect_if_not_authorized_to_view(user)

        @watering = @plant.waterings.build
    end

    def create
        # plant_waterings_path
        # POST /plants/:plant_id/waterings

        @watering = @plant.waterings.build(watering_params)
        if @watering.save
            redirect_to @plant
        else
            render :new
        end

    end
    
    def show
        # watering_path
        # GET /waterings/:id
    end

    def edit
        # edit_watering_path
        # GET /waterings/:id/edit

        plant = @watering.plant
        user = plant.user
        redirect_if_not_authorized_to_view(user)

    end

    def update
        # watering_path
        # PATCH /waterings/:id

        if @watering.update(watering_params)
            redirect_to @watering
        else
            render :new
        end
    end

    def destroy
        # watering_path
        # DELETE /waterings/:id

        plant = @watering.plant
        @watering.destroy
        redirect_to plant
    end

    private

    def find_and_set_plant
        @plant = Plant.find_by_id(params[:plant_id])
    end

    def find_and_set_watering
        @watering = Watering.find_by_id(params[:id])
    end

    def watering_params
        params.require(:watering).permit(:notes)
    end

end