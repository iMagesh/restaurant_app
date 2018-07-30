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

  after_create :notify_email_guest, :notify_email_restaurant
  after_update :email_changes_guest

  def restaurant_shift_check
    if self.reservation_from && self.reservation_to && self.restaurant_shift
      if self.reservation_from.strftime("%H%M") < self.restaurant_shift.start_time.strftime("%H%M") or self.reservation_to.strftime("%H%M") > self.restaurant_shift.end_time.strftime("%H%M")
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

  def self.api_format
    self.distinct.collect { |booking| {
      guest_name: booking.guest.name,
      guests_count: booking.guests_count,
      table_name: booking.restaurant_table.name,
      reservation_time: booking.reservation_time
    }}
  end

  def reservation_time
    "#{self.reservation_from.strftime("%l%P")} - #{self.reservation_to.strftime("%l%P")}"
  end

  def notify_email_guest
    NotifyMailer.notify_email_guest(self).deliver_now
  end

  def notify_email_restaurant
    NotifyMailer.notify_email_restaurant(self).deliver_now
  end

  def email_changes_guest
    NotifyMailer.email_changes_guest(self, self.changes).deliver_now
  end


end
