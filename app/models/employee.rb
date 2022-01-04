class Employee < ApplicationRecord
  has_paper_trail
  scope :actives, -> { where.not(latitude: nil, longitude: nil) }
  validates :name, :email, :address, presence: true
  validates :email, :document, uniqueness: true
  belongs_to :user
  after_validation :geocode
  geocoded_by :address

  extend FriendlyId
  friendly_id :name, use: :slugged

  def nearest_tasks
    Task.near([latitude, longitude], 100)
  end
end
