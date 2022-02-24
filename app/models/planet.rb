class Planet < ApplicationRecord
  has_many :bookings, dependent: :destroy
  belongs_to :user
  has_many_attached :photos
  include PgSearch::Model
  pg_search_scope :search_by_name_and_galaxy,
    against: [ :name, :location ],
    using: {
      tsearch: { prefix: true }
    }

  validates :name, presence: true, uniqueness: true
end
