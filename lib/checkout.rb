class Checkout
  attr_reader :basket, :promotions

  def initialize promo = []
    @promotions = promo
    @basket = []
  end

  def scan item
    self.basket << item
  end

  def total
    @basket.reduce(0) { |sum, item| sum += item.price }
  end


end
