class Watering < ApplicationRecord
  belongs_to :plant

  validates :date_time, presence: true
end
