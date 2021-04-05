class Species < ApplicationRecord
    has_many :plants
    has_many :users, through: :plants
    validates :common_name, presence: true
    validates :water_frequency, presence: true
    validates :image_path, presence: true
    validates :notes, presence: true

    def number_of_plants
        Plant.species(self).count
    end

end
