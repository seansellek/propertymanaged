# Preview all emails at http://localhost:3000/rails/mailers/invite_mailer

class InviteMailerPreview < ActionMailer::Preview
  def new_tenant_invite
    @invite = Invite.take
    @path = 'www.google.com'
    InviteMailer.new_tenant_invite(@invite, @path)
  end

end
