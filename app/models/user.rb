class User < ApplicationRecord
  validates :name, :email, :address, presence: true
  after_validation :geocode
  geocoded_by :address
  has_and_belongs_to_many :tasks, join_table: "tasks_users"

  after_create do
    broadcast_prepend_to "users"
  end
  after_update do
    broadcast_update_to "users"
  end
  after_destroy_commit do
    broadcast_remove_to "users"
  end
end
