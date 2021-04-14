class User < ApplicationRecord
    has_many :plants
    has_many :waterings, through: :plants
    has_many :species, through: :plants

    has_secure_password

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: {in: 4..15}
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :email, presence: true
    validates :email, uniqueness: true

    # Instance methods

    def plants_that_need_to_be_watered
        plants.select do |plant|
            plant.needs_to_be_watered?
        end
    end

    def number_of_plants
        Plant.user(self).count
    end

    # Class Methods

    def self.from_omniauth(auth)
        self.find_or_create_by(uid: auth["uid"]) do |user|
            user.email = auth['info']['email']
            user.password = SecureRandom.hex(20)
            user.username = auth['info']['name'].downcase.gsub(" ", "_")
        end
    end

end
