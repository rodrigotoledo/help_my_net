class AddCompanyToTasks < ActiveRecord::Migration[7.0]
  def change
    add_reference :tasks, :company, foreign_key: true
  end
end
