class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.references :task, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.references :author, null: true, foreign_key: {to_table: :users}
      t.string :message, null: false

      t.timestamps
    end
  end
end
