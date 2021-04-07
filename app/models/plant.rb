class Plant < ApplicationRecord
  belongs_to :species
  belongs_to :user
  has_many :waterings, dependent: :destroy

  validates :nickname, length: {maximum: 20}
  validates :water_frequency, presence: true

  before_validation :inherit_water_frequency_from_species_if_nil

  scope :species, -> (species) {where(species_id: species.id)}
  scope :user, -> (user) {where(user_id: user.id)}

  # Display user's species.common_name if no nickname

  def nickname_for_views
    if nickname
      nickname
    else
      "#{user.username}'s #{species.common_name}"
    end
  end

  # Watering Methods

  def most_recent_watering
    Watering.most_recent_watering(self)[0]
  end

  def most_recent_watering_date
    most_recent_watering.datetime.to_date
  end

  def days_since_most_recent_watering
    date_dif = Date.today - most_recent_watering_date
    date_dif.to_i
  end

  def watering_due_today?
    days_since_most_recent_watering == water_frequency ? true : false
  end

  def watering_overdue?
    days_since_most_recent_watering > water_frequency ? true : false
  end

  def needs_to_be_watered?
    watering_due_today? || watering_overdue? ? true : false
  end

  def water_again_on_date
    if needs_to_be_watered?
      Date.today
    else
      Date.today + (water_frequency - days_since_most_recent_watering).days
    end
  end

  def water_again_in_days
    date_dif = water_again_on_date - Date.today
    date_dif.to_i
  end
  
  private

  def inherit_water_frequency_from_species_if_nil
    if water_frequency == nil
      self.water_frequency = species.water_frequency
    end
  end

end
