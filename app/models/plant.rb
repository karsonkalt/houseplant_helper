class Plant < ApplicationRecord
  belongs_to :species
  belongs_to :user
  has_many :waterings

  validates :nickname, length: {maximum: 20}

  before_validation :inherit_water_frequency_from_species_if_nil

  def most_recent_watering
    Watering.most_recent_watering(self)
  end
  
  private

  def inherit_water_frequency_from_species_if_nil
    if water_frequency == nil
      self.water_frequency = species.water_frequency
    end
  end

end
