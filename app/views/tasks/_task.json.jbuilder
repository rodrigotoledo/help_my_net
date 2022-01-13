json.extract! task, :id, :title, :description, :address, :latitude, :longitude, :created_at, :updated_at
json.url task_url(task, format: :json)
