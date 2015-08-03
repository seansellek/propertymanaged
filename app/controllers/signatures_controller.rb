class SignaturesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:callbacks]

  def callbacks
    render json: 'Hello API Event Received', status: 200
  end

  def new
  end

  def create
    @embedded_request = create_embedded_request(name: params[:name], email: params[:email])
    @sign_url = get_sign_url(embedded_request)
    render :embedded_signature
  end

  private
#creates an embedded signature request to send to hello_sign
def create_embedded_request(opts = {})
  HelloSign.create_embedded_signature_request(
    test_mode: 1, #for testing set to 1, once we blow up, set to 0.
    client_id: 'client_id', #needs to be changed to actual client id
    subject: 'My first embedded signature request',
    message: 'Awesome!',
    signers: [
      {
        email_address: opts[:email],
        name: opts[:name]
      }
    ],
    files: ['actual_name_of_file.pdf'] 
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
