require 'spec_helper'
require 'basket_promotion'

describe BasketPromotion do
  subject(:promo) { BasketPromotion.new(min_basket_price, discount) }

  let(:min_basket_price)  { 300 }
  let(:discount)          { 12 }
  let(:item_list)         { { "001" => 2, "002" => 1 } }
  let(:current_total)     { 440 }

  before(:each) do
    promo.current_total = current_total
  end

  describe "#qualify?" do
    context "does not have required total" do
      let(:current_total) { 200 }
      it "returns false" do
        expect( promo.qualify? ).to be(false)
      end
    end

    context "basket has required total" do
      it "returns true" do
        expect( promo.qualify? ).to be(true)
      end
    end
  end
end

