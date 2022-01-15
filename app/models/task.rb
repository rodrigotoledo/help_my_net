class Task < ApplicationRecord
  validates :title, :description, :address, presence: true
  after_validation :geocode
  geocoded_by :address
  has_and_belongs_to_many :users, join_table: "tasks_users"
  has_many :messages
  accepts_nested_attributes_for :messages, reject_if: :all_blank

  after_create do
    broadcast_prepend_to "tasks"
  end
  after_update do
    broadcast_update_to "tasks"
  end
  after_destroy_commit do
    broadcast_remove_to "tasks"
  end
end
