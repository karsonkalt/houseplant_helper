class User < ApplicationRecord
    has_many :plants, dependent: :destroy
    has_many :waterings, through: :plants
    has_many :species, through: :plants

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: {in: 4..15}
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :email, presence: true
    validates :email, uniqueness: true

    def number_of_plants
        Plant.user(self).count
    end

end
