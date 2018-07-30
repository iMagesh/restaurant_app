class RestaurantShift < ActiveRecord::Base
  belongs_to :restaurant
  has_many :reservations

  validates :name, presence: true
  validates :start_time, presence:true
  validates :end_time, presence: true
  validates :restaurant_id, presence: true

  validate :shift_start_end_time

  def shift_time
    "#{self.start_time.strftime("%l%P")} - #{self.end_time.strftime("%l%P")}"
  end

  def shift_start_end_time
    if (self.start_time && self.end_time) && (self.start_time > self.end_time)
      errors.add(:restaurant_shift, "end time cannot be less than start time")
    end
  end

end
