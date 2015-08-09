module Monify
  def money_to_i money_string
   i = money_string.gsub(/\D/, '').to_i
   i = i*100 unless money_string.include? "."
   i
  end
  def i_to_money money_int
    s = money_int.to_s
    prefix = [ '0.00', '0.0', '0.' ]
    if(prefix[s.length])
        s = prefix[s.length] + s
    else
        s[-2,0] = '.'
        ((s.length / 3) - 1).times do |i|
          j = i * 4
          j+=6
          s[-j,0] = ','
        end
    end
    '$' + s
  end
end
