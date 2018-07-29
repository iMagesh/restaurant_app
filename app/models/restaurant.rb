class Restaurant < ActiveRecord::Base
  has_many :restaurant_shifts
  has_many :restaurant_tables
  has_many :reservations, through: :restaurant_tables

  validates :name, presence: true
  validates :email, format: {
    with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i },
    presence: true
  validates :phone, presence: true,
                 numericality: true,
                 length: { :minimum => 10, :maximum => 15 }

end
