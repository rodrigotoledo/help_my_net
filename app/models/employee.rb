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
  before_validation do
    self.user = User.create(email: self.email, password: 'aassdd', password_confirmation: 'aassdd', first_name: name) if self.user.blank?
  end

  def nearest_tasks
    Task.near([latitude, longitude], 10)
  end
end
