class RemoveTableEmployeeTasks < ActiveRecord::Migration[7.0]
  def up
    drop_table :employee_tasks
  end

  def down
    create_table :employee_tasks
  end
end
