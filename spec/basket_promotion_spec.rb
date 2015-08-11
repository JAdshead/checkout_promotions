require 'spec_helper'
require 'basket_promotion'

describe BasketPromotion do
  subject(:promo) { BasketPromotion.new(min_basket_price, discount) }

  let(:min_basket_price) { 300 }
  let(:discount) { 10 }

  let(:empty_basket) { double("Basket", total_price: 0, items: [] ) }
  let(:full_basket) { double("Basket", total_price: 440, items: [item,item, item2] ) }

  let(:item) { instance_double("Item", product_code: '001', price: 140) }
  let(:item2) { instance_double("Item", product_code: '002', price: 160) }

  describe "#get_discount" do
    it { expect(promo.get_discount full_basket ).to be(10) }
  end

  describe "#qualify?" do
    context "does not have required total" do
      it { expect(promo.qualify? empty_basket).to be(false) }
    end
    context "basket has required total" do
      it { expect(promo.qualify? full_basket).to be(true) }
    end
  end

end

