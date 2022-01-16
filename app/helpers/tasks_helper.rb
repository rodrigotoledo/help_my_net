module TasksHelper
  def user_directions(user)
    return [] if user.nil?
    [[user.longitude, user.latitude]]
  end
end
