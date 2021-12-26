class MessagesController < ApplicationController
  before_action :set_task
  def create
    message = @task.messages.build(message_params)
    if current_user.is_admin?
      message.user = current_user
    else
      message.author = current_user
    end
    message.save!
    redirect_to edit_task_path(@task)
  end

  private

  def set_task
    @task = Task.friendly.find(params[:task_id])
  end

  def message_params
    params.require(:message).permit(:message)
  end
end
