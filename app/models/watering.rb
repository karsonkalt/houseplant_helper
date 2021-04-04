class Watering < ApplicationRecord
  belongs_to :plant

  validates :datetime, presence: true
end
