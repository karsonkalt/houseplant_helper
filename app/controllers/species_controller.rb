class SpeciesController < ApplicationController

    before_action :find_and_set_species, only: [:show]

    def index
        @species = Species.all
    end
    
    def show
    end

    private

    def find_and_set_species
        @species = Species.find_by_id(params[:id])
    end

end
