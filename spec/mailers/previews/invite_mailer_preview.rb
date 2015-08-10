# Preview all emails at http://localhost:3000/rails/mailers/invite_mailer
class InviteMailerPreview < ActionMailer::Preview
  def new_tenant_invite invite, path
    @invite = create :invite
    @path = path
    InviteMailer.new_tenant_invite(@invite, @path)
  end

end
