module Utils

  def price_to_pence price
    return price if price.is_a?(Integer)
    price.to_s.sub('£','').sub('.','').to_i
  end
  module_function :price_to_pence


  def show_price int
    "£" + ( '%.2f' % (int/100.0))
  end
  module_function :show_price

end
