# frozen_string_literal: true

class Category < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  has_many :tasks, dependent: :destroy
end
