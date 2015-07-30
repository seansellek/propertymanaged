class Property < ActiveRecord::Base
	has_many :property_tenants

	def address
		output=''
		output << address1 + ' ' if address1
		output << address2 + ' ' if address2
		output << city + ', ' if city
		output << state + ', ' if state
		output << zip  if zip
		return output
	end
end
