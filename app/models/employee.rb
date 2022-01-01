class Employee < ApplicationRecord
  has_paper_trail
  scope :actives, -> { where.not(latitude: nil, longitude: nil) }
  validates :name, :email, :address, presence: true
  validates :email, :document, uniqueness: true
  after_validation :geocode
  geocoded_by :address

  extend FriendlyId
  friendly_id :name, use: :slugged
end
