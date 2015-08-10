class Qualification

  attr_accessor :price, :products

  def initialize price = 0, products = []
    self.price = price
    self.products = products
  end

  def qualify? basket

end
