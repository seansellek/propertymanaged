class InvoicesController < ApplicationController
  before_action :require_logged_in
  before_action :require_landlord, only: [:mark_paid]
  before_action :require_tenant
  def show
    @invoice = Invoice.find(params[:id])
    # if invoice.id =
    #   flash[:error] = "You have no current invoices"
    #   render :back
    # end
  end

  def mark_paid
    Invoice.find(params[:id]).paid = true
  end

end
