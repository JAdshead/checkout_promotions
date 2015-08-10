require 'spec_helper'
require 'checkout'

describe Checkout do
  subject(:checkout) { Checkout.new }

  let(:promotional_rules) { [promotion_1, promotion_2] }
  let(:promotion_1) { instance_double("Promotion" ) }
  let(:promotion_2) { instance_double("Promotion") }

  let(:item) { double("Item", price: 140) }
  let(:item2) { double("Item", price: 160) }

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

  describe "#scan" do
    it 'adds item to basket' do
      expect { checkout.scan(item) }.to change { checkout.basket.count }.from(0).to(1)
    end
  end


  describe "#basket_total" do
    it 'returns basket total' do
      checkout.scan(item)
      checkout.scan(item2)
      expect( checkout.basket_total ).to eq(300)
    end
  end

  describe "#total" do
    context "with no promotions" do
      it 'returns total with no discount' do
        checkout.scan(item)
        checkout.scan(item2)
        expect( checkout.total ).to eq(300)
      end
    end

    context "with promotions" do
      subject(:checkout) { Checkout.new(promotional_rules) }

      it 'returns total with discount applied' do
        allow(promotion_1).to receive(:get_discount).and_return("50")
        allow(promotion_2).to receive(:get_discount).and_return("50")
        # allow(promotion_2).to receive(:get_discount).with('basket', 'basket_total').and_return("50")

        checkout.scan(item)
        checkout.scan(item2)
        expect( checkout.total ).to eq(200)
      end
    end
  end

  # describe "#discount" do
  #   context "with no promotions" do
  #     it { expect( checkout.discount ).to eq(0) }
  #   end

  #   context "with promotions" do
  #     context "basket discount" do
  #       it "applies discount to basket"
  #     end

  #     context "item discount" do
  #       it "applies discount to basket"
  #     end

  #     context "multiple discounts" do
  #       it "applies discount to basket"
  #     end
  #   end
  # end

end

