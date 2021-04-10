class PlantsController < ApplicationController

    before_action :find_and_set_user, only: [:index, :new]
    before_action :find_and_set_plant, only: [:show, :edit, :update, :destroy]

    def index
        # user_plants_path
        # GET /users/:user_id/plants

        @plants = @user.plants 
    end

    def new
        # new_user_plant_path
        # GET /users/:user_id/plants/new

        @plant = @user.plants.build
    end

    def create
        # user_plants_path
        # POST /users/:user_id/plants

        @plant = @user.plants.build(plant_params)
        if @plant.save
            redirect_to @plant
        else
            render :new
        end
    end
    
    def show
        # plant_path
        # GET /plants/:id

    end

    def edit
        # plant_path
        # GET /plants/:id/edit

    end

    def update
        # plant_path
        # PATCH /plants/:id

    end

    def destroy
        # plant_path
        # DELETE /plants/:id
         
    end

    private

    def find_and_set_user
        @user = User.find_by_id(params[:user_id])
    end

    def find_and_set_plant
        @plant = Plant.find_by_id(params[:id])
    end

    def plant_params
        params.require(:plant).permit(:species_id, :nickname, :water_frequency)
    end
end