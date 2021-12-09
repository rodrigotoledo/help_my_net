# frozen_string_literal: true

json.extract! task, :id, :category_id, :title, :description, :completed_at, :created_at, :updated_at
json.url task_url(task, format: :json)
