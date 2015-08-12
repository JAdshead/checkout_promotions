module Utils

  # utility method used to ensure that the price is handled in pence
  def price_to_pence price
    return price if price.is_a?(Integer)

    if price =~ /\A[£]?\d+\.\d{2}\Z/
      price.to_s.sub('£','').sub('.','').to_i
    elsif price =~ /\A[£]\d+[^\.]\Z/
      price.to_s.sub('£','').to_i * 100
    elsif price =~ /\A\d+$\Z/
      price.to_i
    else
      raise(TypeError, "#{price} incompatible. Compatible formats example £10.00, '£10.00','£10','1000'")
    end

  end
  module_function :price_to_pence

  # method to display price in formated string
  def show_price int
    format('£%.2f', (int/100.0))
  end
  module_function :show_price

end
