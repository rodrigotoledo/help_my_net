module Api
  class TasksController < ApplicationController
    def create
      author = User.find_or_initialize_by(email: author_params[:email])
      if author.new_record?
        author.attributes = author_params
        author.save(validate: false)
      end
      author_task = author.author_tasks.build(task_params)
      author_task.category = Category.first
      author_task.save(validate: false)
      head :ok
    end

    def index
      render json: api_user.employee.nearest_tasks.as_json(only: [:id, :title, :address, :latitude, :longitude])
    end

    private

    def author_params
      params.require(:author).permit(:first_name, :email)
    end

    def task_params
      params.require(:task).permit(:category_id, :title, :address,
        :description, :latitude, :longitude)
    end
  end
end
