class Reservation < ActiveRecord::Base
  belongs_to :restaurant_table
  belongs_to :guest
end
