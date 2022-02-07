class Company < ApplicationRecord
  has_many :tasks
  validates :name, presence: true, uniqueness: true

  after_create do
    broadcast_prepend_to "companies"
  end
  after_update do
    broadcast_update_to "companies"
  end
  after_destroy_commit do
    broadcast_remove_to "companies"
  end

  def to_s
    name
  end
end