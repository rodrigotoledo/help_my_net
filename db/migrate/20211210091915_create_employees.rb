class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :document
      t.string :email
      t.string :phone_number
      t.string :mobile_number
      t.string :address
      t.string :alternative_email

      t.timestamps
    end
  end
end
