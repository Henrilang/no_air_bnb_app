class Planet < ApplicationRecord
  has_many :bookings
  belongs_to :user
  has_many_attached :photos

  validates :name, presence: true, uniqueness: true
end
