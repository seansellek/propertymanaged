class InviteMailer < ApplicationMailer

  def new_tenant_invite invite, path
    @invite = invite
    @path = path
    mail(to: @invite.email, subject: "Your registration link")
  end
  def existing_tenant_invite invite
    @invite = invite
    mail(to: @invite.email, subject: "Welcome back to Kito!")
  end

  def send_invoice invoice
    @invoice = invoice
    mail(to: @invoice.tenant.email, subject: "Your rent is due soon")
  end
end
