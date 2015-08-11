require 'spec_helper'
require 'promotional_rule'

describe PromotionalRule do
  subject(:promo) { PromotionalRule.new(discount) }
  let(:discount) { 10 }

  let(:empty_basket) { double("Basket", total_price: 0, items: [] ) }
  let(:full_basket) { double("Basket", total_price: 440, items: [item,item, item2] ) }

  before(:each) do
    allow(empty_basket).to receive(:empty?).and_return(true)
    allow(full_basket).to receive(:empty?).and_return(false)
  end

  let(:item) { instance_double("Item", product_code: '001', price: 140) }
  let(:item2) { instance_double("Item", product_code: '002', price: 160) }

  describe "#get_discount" do
  end

  describe "#qualify?" do
    context "empty basket" do
      it { expect(promo.qualify? empty_basket).to be(false) }
    end
    context "full basket" do
      it { expect(promo.qualify? full_basket).to be(true) }
    end
  end

end
