class Watering < ApplicationRecord
  belongs_to :plant

  validates :datetime, presence: true

  before_validation :add_datetime_now_if_nil

  scope :most_recent_watering, -> plant { where(plant_id: plant.id).order("datetime DESC").limit(1) }

  private

  def add_datetime_now_if_nil
    if datetime == nil
      self.datetime = DateTime.now
    end
  end
end
