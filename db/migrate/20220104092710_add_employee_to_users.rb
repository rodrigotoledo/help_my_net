class AddEmployeeToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :user, null: true, foreign_key: true
  end
end
