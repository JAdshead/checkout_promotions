require 'utils'

class Checkout
  attr_reader :promotions
  attr_accessor :items

  def initialize promos = []
    @promotions = promos.is_a?(Array) ? promos : promos.to_a
    @discount = 0
    @items = []
  end

  def scan item
    self.items << item
  end

  # checks if promotion is met and returns the total discount.
  def check_promos
    @promotions.each do |promo|
      @discount += promo.check_discount(list_items, total_price).to_i
    end
  end

  # creates a hashed list of the items, key is item product code, value is quantity
  def list_items
    self.items.reduce(Hash.new(0)) { |list, item| list[item.product_code] += 1; list }
  end

  # return the checkout total in pence with the current discount
  def total_price
    self.items.reduce(0) { |sum, item| sum += item.price } - @discount
  end

  # returns total as string for display purposes
  def total
    check_promos
    Utils.show_price( total_price )
  end

end
