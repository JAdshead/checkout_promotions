require 'spec_helper'
require 'item'
require 'checkout'
require 'basket_promotion'
require 'item_promotion'

# feature spec to test complete system
describe "checkout system" do
  subject(:checkout) { Checkout.new }
  item  = Item.new("001", "Lavender heart", "£9.25")
  item2 = Item.new("002", "Personalised cufflinks", "£45.00")
  item3 = Item.new("003", "Kids T-shirt", "£19.95")

  basket_promo = BasketPromotion.new('£60.00', "10%")
  item_promo = ItemPromotion.new('001',2, '£0.75')

  describe "single basket promo" do
    subject(:checkout) { Checkout.new([basket_promo]) }

    context "total price not enough for promo" do
      it "does not discount" do
        checkout.scan(item)
        checkout.scan(item)

        expect( checkout.total ).to eq("£18.50")
      end
    end

    context "total enough for promo" do
      it "applies discount" do
        checkout.scan(item)
        checkout.scan(item2)
        checkout.scan(item3)

        expect( checkout.total ).to eq("£66.78")
      end
    end
  end

  describe "single items promo" do
    subject(:checkout) { Checkout.new([item_promo]) }

    context "not enought items for promo" do
      it "does not apply discount" do
        checkout.scan(item)
        checkout.scan(item2)
        checkout.scan(item3)

        expect( checkout.total ).to eq("£74.20")
      end
    end

    context "with enought items" do
      it "appies discount" do
        checkout.scan(item)
        checkout.scan(item3)
        checkout.scan(item)

        expect( checkout.total ).to eq("£36.95")
      end
    end
  end

  describe "multiple promos" do
    subject(:checkout) { Checkout.new([basket_promo, item_promo ] ) }

    context "meets basket but not item" do
      it "does not apply discount" do
        checkout.scan(item)
        checkout.scan(item2)
        checkout.scan(item3)
        checkout.scan(item3)

        expect( checkout.total ).to eq("£84.74")
      end
    end

    context "meets item but not basket" do
      it "applies discount" do
        checkout.scan(item)
        checkout.scan(item3)
        checkout.scan(item)
        checkout.scan(item)

        expect( checkout.total ).to eq("£45.45")
      end
    end

    context "meets both promos" do
      subject(:checkout) { Checkout.new([ item_promo, basket_promo ] ) }
      it "applies discount" do
        checkout.scan(item)
        checkout.scan(item2)
        checkout.scan(item)
        checkout.scan(item3)

        expect( checkout.total ).to eq("£73.76")
      end

    end

  end
end

