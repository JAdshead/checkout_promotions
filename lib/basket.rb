class Basket
  attr_accessor :items

  def initialize
    self.items = []
  end

  def add_item item
    self.items << item
  end

  def total_items
    self.items.count
  end

  def empty?
    total_items == 0 ? true : false
  end

  def total_price
    self.items.reduce(0) { |sum, item| sum += item.price }
  end

  def list_items
    self.items.reduce(Hash.new(0)) { |list, item| list[item.product_code.to_sym] += 1; list }
  end

end
