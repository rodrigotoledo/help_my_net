# frozen_string_literal: true

class AddConfirmableToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users do |t|
      t.string :confirmation_token
      t.string :unconfirmed_email
      t.timestamp :confirmed_at
      t.timestamp :confirmation_sent_at
    end
  end
end
