require 'spec_helper'
require_relative '../lib/checkout'

describe Checkout do
  subject(:checkout) { Checkout.new }
  let(:promotional_rules) { [promotion_1, promotion_2] }
  let(:promotion_1) { double("Promotion") }
  let(:promotion_2) { double("Promotion") }

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
    let(:item) { double("Item") }

    it 'adds item to basket' do
      expect { checkout.scan(item) }.to change { checkout.basket.count }.from(0).to(1)
    end
  end

  describe "#total" do
    let(:item) { double("Item", price: 140) }
    let(:item2) { double("Item", price: 160) }

    it 'returns basket total' do
      checkout.scan(item)
      checkout.scan(item2)

      expect( checkout.total ).to eq(300)
    end

  end

end

