module ApplicationHelper
  def map_location(owner)
    [owner.longitude, owner.latitude].to_s
  end
end
