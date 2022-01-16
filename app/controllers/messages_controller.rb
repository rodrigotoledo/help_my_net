class MessagesController < ApplicationController
  before_action :set_task
  def new
  end

  def create
    message = @task.messages.build(message_params)
    message.user = current_user
    message.save!
    redirect_to edit_task_path(@task)
  end

  private

  def set_task
    @task = Task.find(params[:task_id])
  end

  def message_params
    params.require(:message).permit(:message)
  end
end
