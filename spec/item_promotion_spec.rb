require "spec_helper"
require 'item_promotion'

describe ItemPromotion do
  subject(:promo) { ItemPromotion.new( discounted_item, min_item_quantity, discount) }

  let(:min_item_quantity) { 2 }
  let(:discounted_item) { "001" }
  let(:discount) { 20  }

  let(:item_list) { { "001" => 2, "002" => 1 } }
  let(:empty_list) { Hash.new(0) }
  let(:current_total) { 440 }

  before(:each) do
    promo.item_list = item_list
    promo.current_total = current_total
  end

  describe "#check_discount" do
    it { expect(promo.check_discount item_list, current_total).to be(40) }
    it { expect(promo.check_discount empty_list, current_total).to be(0) }
  end

  describe "#qualify?" do
    context "does not have required items" do

      it "returns false" do
        promo.item_list = empty_list
        expect(promo.qualify?).to be(false)
      end
    end
    context "basket has required items" do
      it "returns true" do
        expect(promo.qualify?).to be(true)
      end
    end
  end

end
