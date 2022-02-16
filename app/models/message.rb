class Message < ApplicationRecord
  belongs_to :task
  belongs_to :user, optional: true
  belongs_to :employee, optional: true

  validates :message, presence: true
  validates_associated :task

  after_create_commit -> {
    broadcast_append_to "messages", target: "messages_#{self.task_id}"
    broadcast_update_to "new_message", target: "count_message_#{self.task_id}", html: self.task.messages.count
  }

  after_destroy_commit do
    broadcast_remove_to "messages", target: "message_#{self.id}"
    broadcast_update_to "new_message", target: "count_message_#{self.task_id}", html: self.task.messages.count
  end
end
