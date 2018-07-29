class RestaurantTable < ActiveRecord::Base
  belongs_to :restaurant
  has_many :reservations
end
