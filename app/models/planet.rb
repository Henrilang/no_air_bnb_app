class Planet < ApplicationRecord
  belongs_to :user, through: :bookings

  validates :name, presence: true, uniqueness: true
end
