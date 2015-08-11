class Contract < ActiveRecord::Base
  belongs_to :property_tenant
  scope :signed, -> { where(signed: true)}

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

end
