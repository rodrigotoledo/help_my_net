class Task < ApplicationRecord
  validates :title, :description, :address, presence: true
  after_validation :geocode
  geocoded_by :address

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
