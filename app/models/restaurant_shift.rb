class RestaurantShift < ActiveRecord::Base
  belongs_to :restaurant
  has_many :reservations

  validate :shift_start_end_time

  def shift_time
    "#{self.start_time.strftime("%l%P")} - #{self.end_time.strftime("%l%P")}"
  end

  def shift_start_end_time
    errors.add(:restaurant_shift, "end time cannot be less than start time") if self.start_time > self.end_time
  end

end
