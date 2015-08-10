class Item

  attr_reader :price, :name, :product_code

  def initialize product_code, name, price
    @product_code = product_code
    @name = name
    @price = price
  end

end
