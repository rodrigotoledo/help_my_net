module TasksHelper
  def user_directions(user)
    return [] if user.nil?
    [[user.longitude, user.latitude]]
  end

  def employee_directions(employee)
    [employee.longitude, employee.latitude, employee.id]
  end
end
