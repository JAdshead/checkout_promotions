require 'utils'

class Checkout
  attr_reader :basket, :promotions
  attr_accessor :items

  def initialize promos = []
    @promotions = promos.is_a?(Array) ? promos : promos.to_a
    @discount = 0
    self.items = []
  end

  def scan item
    self.items << item
  end

  def check_promos
    @promotions.each do |promo|
      @discount += promo.check_discount(list_items, total_price).to_i
    end
  end

  def list_items
    self.items.reduce(Hash.new(0)) { |list, item| list[item.product_code] += 1; list }
  end

  def total_price
    self.items.reduce(0) { |sum, item| sum += item.price } - @discount
  end

  def total
    check_promos
    Utils.show_price( total_price )
  end

end
