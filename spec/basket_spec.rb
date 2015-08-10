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

      expect( basket.total_price ).to eq(300)
    end
  end
end
