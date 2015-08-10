require 'csv'
class Item

  attr_reader :price, :name, :product_code

  def initialize product_code, name, price
    @product_code = product_code
    @name = name
    @price = price
  end

  def self.all
    @items ||= process_csv
  end

  def self.process_csv
    csv = CSV.read('./db/items.csv', headers: true, header_converters: :symbol)
    items = []
    csv.each do |row|
      puts row[:product_code]
      items <<  Item.new(row[:product_code],row[:name], row[:price])
    end
    items
  end

  def self.find product_code
    index = Item.all.find_index { |item| item.product_code == product_code }
    Item.all[index]
  end

end
