class Employee < ApplicationRecord
  validates :name, :document, :email, :alternative_email, :mobile_number, :phone_number, :address, presence: true
  validates :email, :document, uniqueness: true
end
