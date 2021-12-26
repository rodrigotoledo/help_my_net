class Message < ApplicationRecord
  belongs_to :task
  belongs_to :user, optional: true
  belongs_to :author, class_name: "User", optional: true

  validates :message, presence: true


  after_create do
    broadcast_prepend_to "messages", target: "messages_#{self.task_id}"
    broadcast_update_to "messages", target: "count_message_#{self.task_id}", html: self.task.messages.count
  end
  # after_update_commit { broadcast_replace_to "message_#{self.id}", target: "message_#{self.id}"  }
  after_destroy_commit do
    broadcast_remove_to "messages", target: "message_#{self.id}"
    broadcast_update_to "messages", target: "count_message_#{self.task_id}", html: self.task.messages.count
  end
end
