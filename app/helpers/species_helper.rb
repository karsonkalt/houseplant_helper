module SpeciesHelper

    def display_species_data(species)
        "#{pluralize(species.plants.count, "plant")}, #{pluralize(species.waterings.count, "watering")} logged"
    end

end
