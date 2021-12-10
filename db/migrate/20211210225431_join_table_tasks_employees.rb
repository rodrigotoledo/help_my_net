class JoinTableTasksEmployees < ActiveRecord::Migration[7.0]
  def change
    create_join_table :tasks, :employees
  end
end
