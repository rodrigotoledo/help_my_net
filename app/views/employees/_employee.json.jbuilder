json.extract! employee, :id, :name, :document, :address, :latitude, :longitude, :created_at, :updated_at
json.url employee_url(employee, format: :json)
