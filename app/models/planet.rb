class Planet < ApplicationRecord
  belongs_to :users_id, through: :bookings

  validates :name, presence: true, uniqueness: true
end
