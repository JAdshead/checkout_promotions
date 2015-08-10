require 'spec_helper'
require 'promotional_rule'

describe PromotionalRule do
  subject(:promo) { PromotionalRule.new }

  let(:empty_basket) { double("Basket", total_price: 0, items: [] ) }
  let(:full_basket) { double("Basket", total_price: 440, items: [item,item, item2] ) }

  let(:item) { instance_double("Item", product_code: '001', price: 140) }
  let(:item2) { instance_double("Item", product_code: '002', price: 160) }

  describe "#get_discount" do

  end

  describe "#qualify?" do

    describe "basket price promotion" do
      subject(:promo) { PromotionalRule.new({min_price: 200}) }

      context "does not have required total" do
        it { expect(promo.qualify? empty_basket).to be(false) }
      end
      context "basket has required total" do
        it { expect(promo.qualify? full_basket).to be(true) }
      end
    end


  end
end
