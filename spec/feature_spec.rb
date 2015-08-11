require 'spec_helper'
require 'item'
require 'checkout'
require 'basket'
require 'basket_promotion'
require 'item_promotion'

describe "checkout system" do
  subject(:checkout) { Checkout.new }
  item  = Item.new("001", "Lavender heart", "£9.95")
  item2 = Item.new("002", "Personalised cufflinks", "£45.00")
  item3 = Item.new("003", "Kids T-shirt", "£19.95")

  promo  = BasketPromotion.new('£60.00', 10)
  # promo2 = ItemPromotion.new('001',2, 145)

  describe "single basket promo" do
    context "total price not enough for promo" do
      it "does not discount" do
        checkout.scan(item)
        checkout.scan(item)
        expect(checkout.total).to eq("£19.90")
      end
    end

    context "total enough for promo" do
      subject(:checkout) { Checkout.new([promo]) }
      it "applies discount" do
        checkout.scan(item)
        checkout.scan(item2)
        checkout.scan(item3)
        expect(checkout.total).to eq("£66.78")
      end
    end
  end

  describe "single items promo" do
  end

  describe "multiple promos" do
  end
end

