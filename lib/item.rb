require 'csv'
require 'utils'

class Item
  attr_reader :product_code, :name , :price

  def initialize product_code, name, price
    @product_code = product_code
    @name = name
    @price = Utils.price_to_pence(price)
  end


  # I was unsure how i wanted manage items in the checkout
  # this is unsed but was helpfull when testing ideas in pry
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
