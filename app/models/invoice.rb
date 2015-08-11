class Invoice < ActiveRecord::Base
  belongs_to :property_tenant
  has_one :tenant, through: :property_tenant
  has_one :property, through: :property_tenant
  after_initialize :set_last_notified
  include Monify

  def self.due_soon
    # byebug
    Invoice.where.not(paid: true).select do |invoice|
      time_until_due = invoice.duedate - DateTime.current
      time_until_due < 2.weeks
    end
  end
  def self.need_notification
    # byebug
    self.due_soon.select do |invoice|
      time_since_notified = DateTime.current.to_i - invoice.last_notified.to_i
      time_since_notified > 2.weeks.to_i
    end
  end
  def amount_string
    i_to_money(self.amount)
  end

  private

  def set_last_notified
    self.last_notified ||= Date.today
  end

  def paid_invoice
    self.paid = true
  end

end
