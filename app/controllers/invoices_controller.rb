class InvoicesController < ApplicationController
  before_action :require_logged_in
  def show
    @invoice = Invoice.find(params[:id])
  end

  def edit
  end
end
