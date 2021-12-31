class AddReferenceToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :user, null: true, foreign_key: true
    add_reference :tasks, :author, null: true, foreign_key: {to_table: :users}
  end
end
