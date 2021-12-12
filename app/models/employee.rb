class Employee < ApplicationRecord
  has_paper_trail
  validates :name, :location, :document, :email, :alternative_email, :mobile_number, :phone_number, :address, presence: true
  validates :email, :document, uniqueness: true
  after_validation :geocode
  geocoded_by :location
end
