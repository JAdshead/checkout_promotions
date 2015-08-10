require 'csv'
class Item

  attr_reader :name, :product_code, :price

  def initialize product_code, name, price
    @product_code = product_code
    @name = name
    @price = price
  end

  class << self
    def all
      @items ||= process_csv
    end

    def process_csv
      csv = CSV.read('./db/items.csv', headers: true, header_converters: :symbol)
      items = []
      csv.each do |row|
        items <<  Item.new(row[:product_code],row[:name], row[:price].sub('£','').sub('.','').to_i)
      end
      items
    end

    def find product_code
      index = Item.all.find_index { |item| item.product_code == product_code }
      Item.all[index]
    end
  end

end
