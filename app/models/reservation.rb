class Reservation < ActiveRecord::Base
  belongs_to :restaurant_table
  belongs_to :guest
  belongs_to :restaurant_shift

  validates :guest_id, presence: true
  validates :restaurant_table_id, presence: true
  validates :restaurant_shift_id, presence: true
  validates :reservation_from, presence: true
  validates :reservation_to, presence: true
  validates :guests_count, presence: true, numericality: true, length: {minimum: 1, maximum: 20}
  validate :restaurant_shift_check, :table_availability

  def restaurant_shift_check
    if self.reservation_from && self.reservation_to && self.restaurant_shift
      if self.reservation_from < self.restaurant_shift.start_time or self.reservation_to > self.restaurant_shift.end_time
        errors.add(:reservation, "time slot is out of restaurant shift")
      end
    end
  end

  def table_availability
    if self.restaurant_table
      if self.guests_count < self.restaurant_table.min_guests || self.guests_count > self.restaurant_table.max_guests
        errors.add(:reservation, "Guest count doesn't match with table requirement")
      end
    end
  end


end