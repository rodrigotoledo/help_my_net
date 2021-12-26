class AddCoordinatesToTasks < ActiveRecord::Migration[7.0]
  def change
    add_column :tasks, :address, :string
    add_column :tasks, :latitude, :float
    add_column :tasks, :longitude, :float
  end
end
