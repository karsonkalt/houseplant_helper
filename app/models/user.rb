class User < ApplicationRecord
    has_many :ownerships
    has_many :plants, through: :ownerships
end
