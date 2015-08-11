class InvoicesController < ApplicationController
  before_action :require_logged_in
  before_action :require_landlord, only: [:mark_paid]
  
  def index
    @invoices = current_user.invoices
  end

  def show
    @invoice = Invoice.find(params[:id])
  end

  def mark_paid
    Invoice.find(params[:id]).paid = true
  end

  def close
    @invoice = Invoice.find(params['id'])
    @invoice.paid = true
    @invoice.save
    redirect_to dashboard_path
 end

end
