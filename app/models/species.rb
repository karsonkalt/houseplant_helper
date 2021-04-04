class Species < ApplicationRecord
    validates :common_name, presence: true
    validates :water_frequency, presence: true
    validates :image_path, presence: true
    validates :notes, presence: true
end
