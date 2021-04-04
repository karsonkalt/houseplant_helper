class User < ApplicationRecord
    has_many :ownerships
    has_many :plants, through: :ownerships

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :username, length: {in: 4..15}

    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP } 
end
