class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :document
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
