class Guest < ActiveRecord::Base
  has_many :reservations, dependent: :destroy

  validates :name, presence: true
  validates :email, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }, presence: true

  def self.register(email, name)
    guest = self.create!(email: email, name: name)
    return guest
  end

end
