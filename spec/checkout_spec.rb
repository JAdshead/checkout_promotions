require 'spec_helper'
require 'checkout'

describe Checkout do
  subject(:checkout) { Checkout.new }

  before(:each) { allow(Basket).to receive(:new).and_return(basket)  }

  let(:basket) { double("Basket", add_item: true, total_price: '300' )  }

  let(:promotional_rules) { [promotion_1, promotion_2] }
  let(:promotion_1) { instance_double("Promotion" ) }
  let(:promotion_2) { instance_double("Promotion") }

  let(:item) { instance_double("Item", product_code: '001', price: 140) }
  let(:item2) { instance_double("Item", product_code: '002', price: 160) }


  describe 'initialize' do
    it "initializes checkout with promo rules" do
      co = Checkout.new(promotional_rules)
      expect(co).to be_instance_of(Checkout)
    end

    it "initializes checkout with no promo rules" do
      co = Checkout.new
      expect(co.class).to be(Checkout)
    end
  end

  describe "#total" do
    context "with no promotions" do
      it 'returns total with no discount' do
        checkout.scan(item)
        checkout.scan(item2)
        expect( checkout.total ).to eq("£3.00")
      end
    end

    context "with promotions" do
      subject(:checkout) { Checkout.new(promotional_rules) }

      it 'returns total with discount applied' do
        allow(promotion_1).to receive(:get_discount).and_return("50")
        allow(promotion_2).to receive(:get_discount).and_return("50")

        checkout.scan(item)
        checkout.scan(item2)
        expect( checkout.total ).to eq("£2.00")
      end
    end
  end

end

