require "spec_helper"
require 'item_promotion'

describe ItemPromotion do
  subject(:promo) { ItemPromotion.new( discounted_item, min_item_quantity, discount) }

  let(:min_item_quantity) { 2 }
  let(:discounted_item) { "001" }
  let(:discount) { 20  }
  let(:empty_basket) { double("Basket", total_price: 0, items: [] ) }
  let(:full_basket) { double("Basket", total_price: 440, items: [item, item, item2] ) }
  let(:item) { instance_double("Item", product_code: '001', price: 140) }
  let(:item2) { instance_double("Item", product_code: '002', price: 160) }

  before(:each) do
    allow(empty_basket).to receive(:list_items).and_return(Hash.new(0))
    allow(full_basket).to receive(:list_items).and_return({item.product_code => 2, item2.product_code => 1})
  end

  describe "#get_discount" do
    it { expect(promo.get_discount full_basket ).to be(40) }
    it { expect(promo.get_discount empty_basket ).to be(0) }
  end

  describe "#qualify?" do
    context "does not have required items" do
      it "returns false" do
        promo.store(empty_basket)
        expect(promo.qualify?).to be(false)
      end
    end
    context "basket has required items" do
      it "returns true" do
        promo.store(full_basket)
        expect(promo.qualify?).to be(true)
      end
    end
  end

end
