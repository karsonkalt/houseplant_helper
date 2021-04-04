class Plant < ApplicationRecord
  belongs_to :species
  has_many :waterings
  has_many :ownerships
  has_many :users, through: :ownerships
end
