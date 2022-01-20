class SpeciesController < ApplicationController

    before_action :find_and_set_species, only: [:show]

    def index
        # species_index_path
        # GET /species

        @species = Species.all
    end
    
    def show
        # species_path
        # GET /species/:id
    end

    def easy_plants
        @species = Species.order(water_frequency: :desc).limit(4)
    end

    private

    def find_and_set_species
        @species = Species.find_by_id(params[:id])
    end

end
