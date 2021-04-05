class PlantsController < ApplicationController

    before_action :find_and_set_user
    before_action :find_and_set_plant, only: [:show, :edit, :update, :destroy]

    def index
        @plants = @user.plants 
    end

    def new
        @plant = @user.plants.build
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
        @plant = Plant.find_by(id: params[:id], user_id: @user)
    end
end