class ContractsController < ApplicationController
  before_action :require_logged_in
  def sign
    @contract = Contract.find(params[:id])
    if current_user.contracts.include? @contract
      @contract.signed = true
    else
       render json: { error: 'Permission Denied'}, status: 400
    end
    if @contract.save
      render json: {message: "success"}, status: 200
    else
      render json: { error: @contract.errors.full_messages.join(',')}, status: 400
    end
  end
end
