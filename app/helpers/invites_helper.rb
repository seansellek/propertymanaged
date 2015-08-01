module InvitesHelper
  def new_invite_path(property)
    'properties/#{property.id}/invite/new'
  end
end
