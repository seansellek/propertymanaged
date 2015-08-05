class InviteMailer < ApplicationMailer

  def new_tenant_invite invite, path
    @invite = invite
    @path = path
    mail(to: @invite.email, subject: "Your registration link")
  end

  def send_invoice invoice
    @invoice = invoice
    mail(to: @invoice.tenant.email, subject: "Your rent is due soon")
  end
end
