class Plant < ApplicationRecord
  belongs_to :species
  has_many :waterings
  has_many :ownerships
  has_many :users, through: :ownerships

  validates :nickname, length: {maximum: 20}
  validates :creator_id, presence: true

  before_save :inherit_water_frequency_from_species_if_nil

  private

  def inherit_water_frequency_from_species_if_nil
    if water_frequency == nil
      water_frequency = species.water_frequency
    end
  end
end
