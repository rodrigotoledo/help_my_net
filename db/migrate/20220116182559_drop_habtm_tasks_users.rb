class DropHabtmTasksUsers < ActiveRecord::Migration[7.0]
  def up
    drop_table :tasks_users
  end

  def down
    create_table :tasks_users do |t|
      t.references :task
      t.references :user
    end
  end
end
