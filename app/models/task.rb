# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :category, optional: false
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  has_and_belongs_to_many :employees
end
