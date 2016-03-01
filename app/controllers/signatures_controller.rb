class SignaturesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:callbacks]

  def callbacks
    render json: 'Hello API Event Received', status: 200
  end

  def new
  end

  def index

  end

  def create
    @contract = Contract.new
    embedded_request = create_embedded_request(name: params[:name], email: params[:email])
    @contract.sign_url = get_sign_url(embedded_request)
    @contract.save
    render :embedded_signatures
  end

  private
#creates an embedded signature request to send to hello_sign
def create_embedded_request(opts = {})
  HelloSign.create_embedded_signature_request(
    test_mode: 1,
    client_id: 'a5a0c7391936852c61f3eaa29a25081e',
    subject: 'Lease Agreement',
    message: 'Awesome!',
    signers: [
      {
        email_address: opts[:email],
        name: opts[:name]
      }
    ],
    files: ['/Users/owner/Downloads/samplelease.pdf']
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
