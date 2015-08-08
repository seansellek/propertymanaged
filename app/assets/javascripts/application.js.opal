require 'opal'
require 'opal_ujs'
require 'turbolinks'
require 'jquery'
require 'opal-jquery'
require 'native'
require_tree '.'
##
# Error hiding
##
class Timeout
  def initialize(time=0, &block)
    'setTimeout(function(){#{block.call}}, time)'
  end
end
def hide_error 
  Element.find('#error').css('margin-top', '-50px')
end
def hide_notice 
  Element.find('#notice').css('margin-top', '-50px')
end
Timeout.new 3000 do
    hide_error
    hide_notice
end

displayer = Proc.new do |event|
  event.prevent
  path = event.target.attr(:href)
  HTTP.get(path) do |request|
    form = request.body
    puts form
    Element.find('#popup-form').html(form).slide_down
  end
end
form_hide = Proc.new do |event|
  event.prevent
  Element.find('#popup-form').slide_up
end
form_submit = Proc.new do |event|
  popup = Element.find('#popup-form')
  popup.slide_up
  puts 'Yey'
end



##
# Invite Tenant Form
##
Document.ready? do
  Element.find('.properties').on(:click, '.invite-tenant', &displayer)
  Element.find('#popup-form').on(:click, '#invite-close', &form_hide)
  Element.find('#popup-form').on(:submit, &form_submit)
end

