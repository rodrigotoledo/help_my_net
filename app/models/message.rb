class Message < ApplicationRecord
  belongs_to :task
  belongs_to :user, optional: true
  belongs_to :author, class_name: "User", optional: true

  validates :message, presence: true
end
