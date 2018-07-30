class RestaurantTable < ActiveRecord::Base
  belongs_to :restaurant
  has_many :reservations

  validates :name, presence: true
  validates :min_guests, presence: true, numericality: true
  validates :max_guests, presence: true, numericality: true
  validate :min_max_guest

  def min_max_guest
    if (self.min_guests && self.max_guests) && (self.min_guests > self.max_guests)
      errors.add(:restaurant_table, "min_guests count cannot be greater than max_guests")
    end
  end

end
