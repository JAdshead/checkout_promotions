require 'spec_helper'
require 'promotional_rule'

describe PromotionalRule do
  subject(:promo) { PromotionalRule.new(discount) }
  let(:discount) { 10 }
  let(:empty_basket) { double("Basket", total_price: 0, items: [] ) }
  let(:full_basket) { double("Basket", total_price: 440, items: [item,item, item2] ) }
  let(:item) { instance_double("Item", product_code: '001', price: 140) }
  let(:item2) { instance_double("Item", product_code: '002', price: 160) }

  before(:each) do
    allow(empty_basket).to receive(:empty?).and_return(true)
    allow(full_basket).to receive(:empty?).and_return(false)
  end

  describe "#get_discount" do
    it { expect(promo.get_discount full_basket).to be(10) }
  end

  describe "#qualify?" do
    context "empty basket" do
      it "returns false" do
        promo.store(empty_basket)
        expect(promo.qualify?).to be(false)
      end

    end
    context "full basket" do
      it "returns true" do
        promo.store(full_basket)
        expect(promo.qualify?).to be(true)
      end
    end
  end

end
