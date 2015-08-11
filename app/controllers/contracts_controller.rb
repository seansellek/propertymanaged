class ContractsController < ApplicationController
  before_action :require_logged_in
  def sign
    @contract = Contract.find(params[:id])
    if current_user.contracts.include? @contract
      @contract.signature_id = params[:signature_id]
      @contract.signed = true
    else
       render json: { error: 'Permission Denied'}, status: 400
    end
    if @contract.save
      render json: {message: "success", signature_id: @contract.signature_id}, status: 200
    else
      render json: { error: @contract.errors.full_messages.join(',')}, status: 400
    end
  end
end
