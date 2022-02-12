module TasksHelper
  def user_directions(user)
    return [] if user.nil?
    [[user.longitude, user.latitude]]
  end

  def employees_directions(employees)
    employees.map do |employee|
      [employee.longitude, employee.latitude, employee.id]
    end
  end
end
