# frozen_string_literal: true
class Task < ApplicationRecord
  belongs_to :category, optional: false
  belongs_to :user, optional: true
  belongs_to :author, class_name: "User", optional: true
  has_many :messages, dependent: :destroy
  has_and_belongs_to_many :employees, dependent: :destroy
  validates :title, presence: true, uniqueness: true
  validates :description, :address, presence: true
  after_validation :geocode
  geocoded_by :address

  extend FriendlyId
  friendly_id :title, use: :slugged

  after_create do
    broadcast_prepend_to "tasks"
  end
  after_destroy_commit do
    broadcast_remove_to "tasks"
  end
end
