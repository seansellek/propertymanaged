require 'turbolinks'

require_tree '.'


class Timeout
def initialize(time = 0, & block)
`setTimeout(function(){#{block.call}}, time)`
end
end


hide_error = Proc.new do
    Element.find('#error').css('margin-top', '-50px')
end
displayer = Proc.new do |
event |
    event.prevent
path = event.target.attr(: href)
HTTP.get(path) do |
request |
    form = request.body
puts form
Element.find('#popup-form').html(form).slide_down
end
end
form_hide = Proc.new do |
event |
    event.prevent
Element.find('#popup-form').slide_up
end
form_submit = Proc.new do |
event |
    popup = Element.find('#popup-form')
popup.slide_up
puts 'Yey'
end
monetize = Proc.new do |
event |
    amount = event.target.value
digits = amount.to_s.split
digits.include

end



# #
# Invite Tenant Form
# #
Document.ready ? do
    Element.find('.properties').on(: click, '.invite-tenant', & displayer)
Element.find('#popup-form').on(: click, '#invite-close', & form_hide)
Element.find('#popup-form').on(: submit, & form_submit)
Element.find('#popup-form').on(: input, '#invite_amount', & monetize)
end
Timeout.new(5000, & hide_error)
