class EmployeeChannel < ApplicationCable::Channel
  def subscribed
    stream_from "employee_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
