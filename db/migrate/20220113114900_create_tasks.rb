class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :address
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
