require 'spec_helper'
require 'basket'

describe Basket do
  subject(:basket) { Basket.new }

  let(:item) { double("Item", product_code: '001', price: 140) }
  let(:item2) { double("Item", product_code: '002', price: 160) }

  describe "#add_item" do
    it { expect { basket.add_item(item) }.to change { basket.total_items }.from(0).to(1) }
  end

  describe "#total_price" do
    it 'returns basket total' do
      basket.add_item(item)
      basket.add_item(item2)
      expect( basket.total_price ).to be(300)
    end
  end

  describe "#empty?" do
    it { expect( basket.empty? ).to be(true) }
    context "with items" do
      it "returns true" do
        basket.add_item(item)
        basket.add_item(item2)
        expect( basket.empty? ).to  be(false)
      end
    end
  end

  describe "#list_items" do
    it { expect( basket.list_items ).to eq({}) }

    context "basket with items" do
      it "returns list" do
        basket.add_item(item)
        basket.add_item(item)
        basket.add_item(item2)
        expect( basket.list_items ).to eq({item.product_code => 2, item2.product_code => 1 } )
      end
    end
  end
end
