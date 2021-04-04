class Ownership < ApplicationRecord
  belongs_to :user
  belongs_to :plant
  has_one :user
  has_one :plant
end
