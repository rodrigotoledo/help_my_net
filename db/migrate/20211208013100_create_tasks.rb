# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[7.0]
  def change
    create_table :tasks do |t|
      t.references :category, null: false, foreign_key: true
      t.string :title
      t.text :description
      t.date :completed_at

      t.timestamps
    end
  end
end
