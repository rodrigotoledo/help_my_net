class Task < ApplicationRecord
  after_validation :geocode
  geocoded_by :address
  belongs_to :company
  belongs_to :user
  belongs_to :employee, optional: true
  has_many :messages, dependent: :destroy
  validates :title, :description, :address, presence: true
  validates_associated :company, :user, :employee
  has_rich_text :description

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
