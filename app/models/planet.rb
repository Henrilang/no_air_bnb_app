class Planet < ApplicationRecord
  has_many :bookings
  belongs_to :user

  validates :name, presence: true, uniqueness: true
end
