class Message < ApplicationRecord
  belongs_to :task
  belongs_to :user, optional: true
  belongs_to :author, class_name: "User", optional: true

  validates :message, presence: true

  after_create do
    broadcast_append_to "messages", target: "messages_#{self.task_id}"
    broadcast_update_to "messages", target: "count_message_#{self.task_id}", html: self.task.messages.count
  end
  after_destroy_commit do
    broadcast_remove_to "messages", target: "message_#{self.id}"
    broadcast_update_to "messages", target: "count_message_#{self.task_id}", html: self.task.messages.count
  end
end
