class AddSlugToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :slug, :string
    add_index :employees, :slug, unique: true
  end
end
