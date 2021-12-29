module Api
  class TasksController < ActionController::Base
    # before_action :authenticate_user!
    protect_from_forgery with: :null_session
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
      # ActionCable.server.broadcast 'messages', Faker::Lorem.paragraph
      render json: Task.limit(10).as_json(only: [:id, :title])
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
