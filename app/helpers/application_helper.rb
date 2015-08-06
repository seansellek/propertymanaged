module ApplicationHelper
  def new_invite_path(property)
    "properties/#{property.id}/invite"
  end
  def current_user_type
    session[:user_type].to_sym
  end
end
