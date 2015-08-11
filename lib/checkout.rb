require 'basket'
require 'utils'

class Checkout
  attr_reader :basket, :promotions

  def initialize promos = []
    @promotions = promos.is_a?(Array) ? promos : promos.to_a
    @basket = Basket.new
  end

  def scan item
    @basket.add_item item
  end

  def discount
    if !@promotions.empty?
      @promotions.reduce(0) do |total_discount, promotion|
        total_discount += promotion.get_discount(basket).to_i
      end
    else
      0
    end
  end

  def total
    # require 'pry'; binding.pry
    Utils.show_price(@basket.total_price.to_i - discount.to_i)
  end

end
