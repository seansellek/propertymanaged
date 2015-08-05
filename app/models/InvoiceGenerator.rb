class InvoiceGenerator

  def generate active_occupancies
    active_occupancies.each do |occupancy|
      occupancy.invoice
    end
  end


end
