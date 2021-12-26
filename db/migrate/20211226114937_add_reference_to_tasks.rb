class AddReferenceToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :user, null: false, foreign_key: true
    add_reference :tasks, :author, null: false, foreign_key: {to_table: :users}
  end
end
