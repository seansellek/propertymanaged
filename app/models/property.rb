class Property < ActiveRecord::Base
  belongs_to :landlord
	has_many :property_tenants
	before_destroy :inactivate_occupancies
	def address
		output=''
		output << address1 + ' ' if address1
		output << address2 + ' ' if address2
		output << city + ', ' if city
		output << state + ', ' if state
		output << zip  if zip
		return output
	end
	def active_occupancy
		property_tenants.find_by(active: true)
	end
	def active_occupancy?
		!!active_occupancy
	end
	def inactivate_occupancies
		property_tennants.each do |pt|
			pt.active = false
		end
	end
end
