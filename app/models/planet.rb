class Planet < ApplicationRecord
  has_many :users, through: :bookings

  validates :name, presence: true, uniqueness: true
end
