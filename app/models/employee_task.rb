class EmployeeTask < ApplicationRecord
  belongs_to :employee
  belongs_to :task
end
