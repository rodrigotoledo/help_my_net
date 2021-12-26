# frozen_string_literal: true
class Task < ApplicationRecord
  belongs_to :category, optional: false
  belongs_to :user
  belongs_to :author, class_name: "User"
  has_many :messages
  has_and_belongs_to_many :employees
  validates :title, :address, presence: true, uniqueness: true
  validates :description, presence: true
  after_validation :geocode
  geocoded_by :address

  extend FriendlyId
  friendly_id :title, use: :slugged
end
