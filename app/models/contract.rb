class Contract < ActiveRecord::Base
  belongs_to :property_tenant
  has_one :tenant, :through => :property_tenant
  scope :signed, -> { where(signed: true)}

  def generate_sign_url
    tenant = PropertyTenant.find(self.property_tenant_id).tenant
    name = tenant.name
    email = tenant.email
    embedded_request = create_embedded_request(name, email)
    self.sign_url = get_sign_url(embedded_request)
  end
  def get_sig_id
    signature_request_id = embedded_request.signature_request_id
  end

  def signed_copy
    client = HelloSign::Client.new :api_key => '3f15824568f134bd55f7555ee662337561d05f320b529a0fcb2a17095a2ba10a'
    file_bin = client.signature_request_files :signature_request_id => get_sig_id, :file_type => 'pdf'
    p file_bin
    open("samplelease.pdf", "wb") do |file|
      file.write(file_bin)
    end
  end

  private

  def create_embedded_request(name, email)
  HelloSign.create_embedded_signature_request(
    test_mode: 1,
    client_id: 'a5a0c7391936852c61f3eaa29a25081e',
    subject: 'Lease Agreement',
    message: 'Awesome!',
    signers: [
      {
        email_address: email,
        name: name
      }
    ],
    files: ["#{Rails.public_path}/contract/samplelease.pdf"]
  )
end

def get_sign_url(embedded_request)
  sign_id = get_first_signature_id(embedded_request)
  HelloSign.get_embedded_sign_url(signature_id: sign_id).sign_url
end

def get_first_signature_id(embedded_request)
  embedded_request.signatures[0].signature_id
end




end
