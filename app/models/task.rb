class Task < ApplicationRecord
  after_validation :geocode
  geocoded_by :address
  belongs_to :company
  belongs_to :user
  belongs_to :employee
  has_many :messages, dependent: :destroy
  validates :title, :description, :address, presence: true
  validates_associated :company, :user, :employee

  after_create do
    broadcast_prepend_to "tasks"
    # broadcast_prepend_to "dashboard", target: "dashboard", partial: "dashboard/task", locals: {task: self}
  end
  after_update do
    broadcast_update_to "tasks"
    # broadcast_update_to "dashboard", partial: "dashboard/task", locals: {task: self}
  end
  after_destroy_commit do
    broadcast_remove_to "tasks"
    # broadcast_remove_to "dashboard"
  end
end
