class RemoveTableEmployeeTasks < ActiveRecord::Migration[7.0]
  def change
    drop_table :employee_tasks
  end
end
