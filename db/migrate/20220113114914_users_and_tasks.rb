class UsersAndTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks_users do |t|
      t.references :task
      t.references :user
    end
  end
end
