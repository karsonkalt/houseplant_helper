class Plant < ApplicationRecord
  belongs_to :species
  belongs_to :user
  has_many :waterings

  validates :nickname, length: {maximum: 20}

  before_save :inherit_water_frequency_from_species_if_nil
  
  private

  def inherit_water_frequency_from_species_if_nil
    if water_frequency == nil
      water_frequency = species.water_frequency
    end
  end

end
