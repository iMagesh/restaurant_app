class RestaurantShift < ActiveRecord::Base
  belongs_to :restaurant

  def shift_time
    "#{self.start_time.strftime("%l%P")} - #{self.end_time.strftime("%l%P")}"
  end

end
