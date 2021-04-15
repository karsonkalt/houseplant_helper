class PlantsController < ApplicationController

    before_action :find_and_set_user, only: [:index, :new, :create]
    before_action :find_and_set_plant, only: [:show, :edit, :update, :destroy]

    def index
        # user_plants_path
        # GET /users/:user_id/plants

        find_and_set_plants_and_select_query_parameters
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

    # But does the code below belong in the controller or the model?
    # I think the controller becuase it relates to creating an instance variable and the q params.
    # TODO: As Matteo about the line below.
    # It's not a scope method because it doesn't query the database, it runs on the objects.

    #move into the model, query_parameters can be the argument.

    def find_and_set_plants_and_select_query_parameters
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

end