class PlantsController < ApplicationController

    before_action :find_and_set_user, only: [:index, :new, :create]
    before_action :find_and_set_plant, only: [:show, :edit, :update, :destroy]

    def index
        # user_plants_path
        # GET /users/:user_id/plants
        
        find_and_set_plants_and_filter_query_parameters(request)
    end

    def new
        # new_user_plant_path
        # GET /users/:user_id/plants/new

        redirect_if_not_authorized_to_view(@user)
        @plant = @user.plants.build
    end

    def create
        # user_plants_path
        # POST /users/:user_id/plants

        @plant = @user.plants.build(plant_params)
        if @plant.valid?
            @plant.save
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

        user = @plant.user
        redirect_if_not_authorized_to_view(user)
    end

    def update
        # plant_path
        # PATCH /plants/:id

        if @plant.update(plant_params)
            redirect_to @plant
        else
            render :new
        end
    end

    def destroy
        # plant_path
        # DELETE /plants/:id

        @plant.destroy
        redirect_to root_path
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

    def find_and_set_plants_and_filter_query_parameters(request)
        if !request.query_parameters.empty?
            request.query_parameters.each do |scope, value|
                @plants ||= @user.plants
                @plants = @plants.select do |plant|
                    plant.send("#{scope}").to_s == value
                end
            end
        else
            @plants = @user.plants
        end
    end

    # Check if plant responds to word passed in from scope, so it won't error out.
    # Where instead of select, will run in activerecord models, where chains to activerecord and will already be filtered.

end