class Checkout
  attr_reader :basket, :promotions

  def initialize promos = []
    @promotions = promos
    @basket = []
  end

  def scan item
    self.basket << item
  end

  def discount
    if @promotions.count > 0
      @promotions.reduce(0) do |discount, promotion|
        discount += promotion.get_discount(basket, basket_total).to_i
      end
    else
      0
    end
  end

  def basket_total
    @basket.reduce(0) { |sum, item| sum += item.price }
  end

  def total
    basket_total.to_i - discount.to_i
  end

end
