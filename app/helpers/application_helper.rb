module ApplicationHelper
  def new_invite_path(property)
    "properties/#{property.id}/invite"
  end
end
