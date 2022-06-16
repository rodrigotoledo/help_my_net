class AddEmployeeToTask < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :employee, null: true, foreign_key: true
  end
end
