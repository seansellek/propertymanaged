module Gravatar
  def get_email_hash
    email = self.email
    email.strip!
    Digest::MD5.hexdigest(email)
  end
end
