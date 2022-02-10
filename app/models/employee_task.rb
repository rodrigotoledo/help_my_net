class EmployeeTask < ApplicationRecord
  belongs_to :employee
  belongs_to :task

  after_destroy_commit do
    broadcast_update_to "tasks", partial: "tasks/task", locals: {task: task}, target: "task_#{task.id}"
  end
end
