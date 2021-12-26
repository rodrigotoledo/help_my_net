class AddCoordinatesToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :latitude, :float
    add_column :employees, :longitude, :float
  end
end
