class InviteMailer < ApplicationMailer
  def new_tenant_invite invite, path
    @invite = invite
    @path = path
    mail(to: @invite.email, subject: "Your registration link")
  end
end
