json.extract! employee, :id, :name, :document, :email, :phone_number, :mobile_number, :address, :alternative_email, :created_at, :updated_at
json.url employee_url(employee, format: :json)
