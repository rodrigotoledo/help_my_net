class AddSlugToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :slug, :string
    add_index :tasks, :slug, unique: true
  end
end
